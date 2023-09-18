import cv2
import numpy as np


def check_cone_color(img, xyxy):
    '''
    check color of rubber cone
        img: image
        xyxy: x_min, y_min, x_max, y_max
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
    
    if hsv[0,0,0] < 20 or hsv[0,0,0] >= 140:
        color = ['Orange', [0,100,255]]
    elif hsv[0,0,0] < 60:
        color = ['Yellow', [0,255,255]]
    elif hsv[0,0,0] < 140:
        color = ['Blue', [255,0,0]]
        
    if color[0] is 'Orange':
        print(f"Detecting {color[0]} cone!")

    # color[0] : label, color[1]: RGB val
    return color