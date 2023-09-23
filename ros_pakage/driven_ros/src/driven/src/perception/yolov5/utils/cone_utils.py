import cv2
import numpy as np


def check_cone_color(img, xyxy):
    '''
    콘의 색상을 파악
    parameter
        - img: image
        - xyxy: x_min, y_min, x_max, y_max
    '''    
    mid_y = int((xyxy[1] + xyxy[3])/2)
    
    crop_img = img[mid_y:int(xyxy[3]), int(xyxy[0]):int(xyxy[2])]
    crop_img = np.reshape(crop_img, (-1, 3))
    crop_img = np.float32(crop_img)
    
    criteria = (cv2.TERM_CRITERIA_EPS+cv2.TERM_CRITERIA_MAX_ITER, 10, 1.0)
    
    ret, label, center = cv2.kmeans(crop_img, 1, None, criteria, 10, cv2.KMEANS_RANDOM_CENTERS)
    color = np.int32(center[0])
    bgr = np.uint8([[color]])
    # 대분의 이미지가 그림자 때문인지 회색에 가까움 -> HSV로 변환해서 H 색상 값만 극대화 시켜보기
    hsv = cv2.cvtColor(bgr, cv2.COLOR_BGR2HSV)
    
    if hsv[0,0,0] < 19 or hsv[0,0,0] >= 140:
        color = ['Orange', [0,100,255]]
    elif hsv[0,0,0] < 60:
        color = ['Yellow', [0,255,255]]
    elif hsv[0,0,0] < 140:
        color = ['Blue', [255,0,0]]

    # color[0] : label, color[1]: RGB val
    return color

def emgergency_call(cnt, threshold):
    
    #비상 ㅅㄱ
    if cnt <= threshold:
        print(f'Only {cnt} cones!!')
        return True
    # ㄱㅊ ㅋㅋ
    else:
        return False


def red_cone_stop(image, box_list, color_list, roi, red_stop):
    
    '''
    parameter: image - 원본 이미지
               box_list - 박스 좌표 리스트 xyxy
               color_list - 박스의 색상 리스트
               
    return: 0 - 다른 색 콘들도 섞여있음, 
            1 - 주황콘만 보임, 감속 시작
            2 - 주황콘들이 일렬로 서있음. 최대 감속.
    '''
    
    # 1. Orange 콘만 있는지 확인
    
    if any(x in ['Yellow', 'Blue'] for x in color_list):
        return 0
    ### 통과되면 모든 콘은 Orange
    
    # 2. ROI영역에 Orange 콘이 안들어오면 : 화면의 중앙 부근에 주황콘이 보이지 않으면 아직 최종 경로에 도착하지는 못한 상태라 판단
    if roi_oragne_cone(box_list, roi):
        return 1

    # 2통과시
    # 3. 빨간 콘의 개수
    if len(color_list) < red_stop:
        return 1
    
    # 4. 기울기 테스트 : 좌측 최하단 박스와 우측 최상단 박스의 좌표를 통해 기울기를 계산하여 기울기가 임게치보다 크면 사이드에 콘이 있는 경우이므로 아직 도달 못한 상태라 판단
    
    
    return 2
    
    
def roi_oragne_cone(box_list, roi):
    
    for box in box_list:
        x_min, y_min, x_max, y_max = box[0].item(), box[1].item(), box[2].item(), box[3].item()
        
        x_center = int((x_min + x_max) / 2)
        y_center = int((y_min + y_max) / 2)
        
        if (x_center > roi[0] and x_center < roi[0] + roi[2]) and (y_center > roi[1] and y_center < roi[1] + roi[2]):
            print("Orange Cone in ROI!!")
            #있다
            return False
    # 없다
    return True

def check_gradient(box_list):
    
    # 리스트 안의 값이 텐서라 변환
    box_convert = [[t.item() for t in row] for row in box_list]
    # 초기화 ㄱㄱ
    p1_idx, p2_idx = 0, 0
    
    pass
    

def plot_center_box(image, roi):
    
    image = cv2.rectangle(image, (roi[0], roi[1]), (roi[0] + roi[2], roi[1] + roi[2]), [0, 0, 255], thickness=5, lineType=cv2.LINE_AA)
    
    
def roi_size(image):
    size = image.shape

    y_min = int(size[0] / 3)
    y_max = int(size[0] / 3 * 2)
    length = (y_max - y_min)
    x_min = int(size[1] / 2) - int(length / 2)
    x_max = x_min + length
    
    return (x_min, y_min, length)