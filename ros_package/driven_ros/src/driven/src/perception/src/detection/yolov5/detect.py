#!/usr/bin/python3
#-*- coding:utf-8 -*-

import rospy
import argparse
import time
from pathlib import Path

import cv2
import torch
import torch.backends.cudnn as cudnn
from numpy import random
import numpy as np

from models.experimental import attempt_load
from utils.datasets import LoadStreams, LoadImages
from utils.general import check_img_size, check_requirements, check_imshow, non_max_suppression, apply_classifier, \
    scale_coords, xyxy2xywh, strip_optimizer, set_logging, increment_path
from utils.plots import plot_one_box
from utils.torch_utils import select_device, load_classifier, time_synchronized

# cone detection
from utils.cone_utils import check_cone_color, emgergency_call, red_cone_stop, plot_center_box, roi_size
from detection.msg import det_info

@torch.no_grad()
class YoloDetection:
    def __init__(self):
        
        self.emergency=3, # 사고 직전 보이는 콘 개수
        self.red_stop=9, # 오렌지콘 개수 임계치 for 최종 감속
        self.weights='/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/yolov5/weights/best.pt', # 가중치 경로
        self.source='0', # 0 이면 웹캠, 데이터 경로
        self.imgsz=320,
        self.conf_thres=0.5,
        self.iou_thres=0.45,
        self.device='',
        self.view_img=False,
        self.save_txt=None,
        self.save_conf=None,
        self.classes=None,
        self.agnostic_nms=None,
        self.augment=None,
        self.update=None,
        self.project='runs/detect',
        self.name='cone',
        self.exist_ok=None,
        self.save_img=False

        self.det_pub = rospy.Publisher("/det2main", det_info, queue_size=1)
        
    def run(self):
        # print(type(self.source))
        # if type(self.source) == 'tuple':
        self.emergency=3
        self.red_stop=9
        self.weights='/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/yolov5/weights/best.pt'
        self.source='0'
        self.imgsz=320
        self.conf_thres=0.5
        self.iou_thres=0.45
        self.device=''
        self.view_img=False
        self.save_txt=None
        self.save_conf=None
        self.classes=None
        self.agnostic_nms=None
        self.augment=None
        self.update=None
        self.project='runs/detect'
        self.name='cone'
        self.exist_ok=None
        self.save_img=False


        self.source = '0'
        webcam = self.source.isnumeric() or self.source.endswith('.txt') or self.source.lower().startswith(
            ('rtsp://', 'rtmp://', 'http://'))

        # Directories
        save_dir = Path(increment_path(Path(self.project) / self.name, exist_ok=self.exist_ok))  # increment run
        (save_dir / 'labels' if self.save_txt else save_dir).mkdir(parents=True, exist_ok=True)  # make dir

        # Initialize
        set_logging()
        device = select_device(self.device)
        half = device.type != 'cpu'  # half precision only supported on CUDA

        # Load model
        model = attempt_load(self.weights, map_location=device)  # load FP32 model
        stride = int(model.stride.max())  # model stride
        self.imgsz = check_img_size(self.imgsz, s=stride)  # check img_size
        if half:
            model.half()  # to FP16

        # Second-stage classifier
        classify = False
        if classify:
            modelc = load_classifier(name='resnet101', n=2)  # initialize
            modelc.load_state_dict(torch.load('weights/resnet101.pt', map_location=device)['model']).to(device).eval()

        # Set Dataloader
        vid_path, vid_writer = None, None
        if webcam:
            self.view_img = check_imshow()
            cudnn.benchmark = True  # set True to speed up constant image size inference
            dataset = LoadStreams(self.source, img_size=self.imgsz, stride=stride)
        else:
            self.save_img = True
            dataset = LoadImages(self.source, img_size=self.imgsz, stride=stride)

        # Get names and colors
        names = model.module.names if hasattr(model, 'module') else model.names
        colors = [[random.randint(0, 255) for _ in range(3)] for _ in names]

        # Run inference
        if device.type != 'cpu':
            model(torch.zeros(1, 3, self.imgsz, self.imgsz).to(device).type_as(next(model.parameters())))  # run once
        t0 = time.time()
        for path, img, im0s, vid_cap in dataset:
            img = torch.from_numpy(img).to(device)
            img = img.half() if half else img.float()  # uint8 to fp16/32
            img /= 255.0  # 0 - 255 to 0.0 - 1.0
            if img.ndimension() == 3:
                img = img.unsqueeze(0)

            # Inference
            t1 = time_synchronized()
            pred = model(img, augment=self.augment)[0]

            # Apply NMS
            pred = non_max_suppression(pred, self.conf_thres, self.iou_thres, classes=self.classes, agnostic=self.agnostic_nms)
            t2 = time_synchronized()

            # Apply Classifier
            if classify:
                pred = apply_classifier(pred, modelc, img, im0s)
                
            # Process detections
            for i, det in enumerate(pred):  # detections per image
                if webcam:  # batch_size >= 1
                    p, s, im0, frame = path[i], '%g: ' % i, im0s[i].copy(), dataset.count
                else:
                    p, s, im0, frame = path, '', im0s, getattr(dataset, 'frame', 0)

                p = Path(p)  # to Path
                save_path = str(save_dir / p.name)  # img.jpg
                txt_path = str(save_dir / 'labels' / p.stem) + ('' if dataset.mode == 'image' else f'_{frame}')  # img.txt
                s += '%gx%g ' % img.shape[2:]  # print string
                gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]  # normalization gain whwh
                if len(det):
                    # Rescale boxes from img_size to im0 size
                    det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0.shape).round()

                    # Print results
                    for c in det[:, -1].unique():
                        n = (det[:, -1] == c).sum()  # detections per class
                        s += f"{n} {names[int(c)]}{'s' * (n > 1)}, "  # add to string
                    
                    # check the number of cone
                    emg = False
                    emg = emgergency_call(n, self.emergency)
                    box_list = []
                    color_list = []
                    
                    # red cone detection ROI
                    roi = roi_size(im0)
                    
                    # Write results
                    for *xyxy, conf, cls in reversed(det):
                        if self.save_txt:  # Write to file
                            xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4)) / gn).view(-1).tolist()  # normalized xywh
                            line = (cls, *xywh, conf) if self.save_conf else (cls, *xywh)  # label format
                            with open(txt_path + '.txt', 'a') as f:
                                f.write(('%g ' * len(line)).rstrip() % line + '\n')

                        if self.save_img or self.view_img:  # Add bbox to image
                            
                            # 콘 RGB
                            color = check_cone_color(im0, xyxy)
                            color_list.append(color[0])
                            
                            if color[0] == 'Orange':
                                box_list.append(xyxy)

                            label = f'{color[0]} {conf:.2f}'
                            plot_one_box(xyxy, im0, label=label, color=color[1], line_thickness=3)
                    
                    # 가운데 네모 ROI 박스 만들기
                    plot_center_box(im0, roi)
                                
                    # stop sign when red cones come out
                    stop = red_cone_stop(im0, box_list, color_list, roi, self.red_stop)
                    
                    self.det_publish(emg, stop)
                    
                # Print time (inference + NMS)
                print(f'{s}Done. ({t2 - t1:.3f}s)')

                # Stream results
                if self.view_img:
                    cv2.imshow(str(p), im0)
                    cv2.waitKey(1)  # 1 millisecond

                # Save results (image with detections)
                if self.save_img:
                    if dataset.mode == 'image':
                        cv2.imwrite(save_path, im0)
                    else:  # 'video'
                        if vid_path != save_path:  # new video
                            vid_path = save_path
                            if isinstance(vid_writer, cv2.VideoWriter):
                                vid_writer.release()  # release previous video writer

                            fourcc = 'mp4v'  # output video codec
                            fps = vid_cap.get(cv2.CAP_PROP_FPS)
                            w = int(vid_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
                            h = int(vid_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
                            vid_writer = cv2.VideoWriter(save_path, cv2.VideoWriter_fourcc(*fourcc), fps, (w, h))
                        vid_writer.write(im0)

        if self.save_txt or self.save_img:
            s = f"\n{len(list(save_dir.glob('labels/*.txt')))} labels saved to {save_dir / 'labels'}" if self.save_txt else ''
            print(f"Results saved to {save_dir}{s}")

        print(f'Done. ({time.time() - t0:.3f}s)')

        
    def det_publish(self, emg, stop):
        msg = det_info()
        msg.emg_stop = emg
        msg.stop_rate = stop

        self.det_pub.publish(msg)

if __name__ == '__main__':
    
    rospy.init_node('yolov5', anonymous=True)
    
    det = YoloDetection()
    det.run()
    
    rospy.spin()
