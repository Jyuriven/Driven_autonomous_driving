import pyastar2d
import gradient

def pathplanning(path,start_x,start_y,goal_x,goal_y):
    ### slam 을 통해 일반지도를 입력받아 smoothing 된 path 를 반환합니다. 
    ### path 를 기반으로 모션계획합니다.
    ### 반환 된 smoothing path 는 motion planning 에 사용됩니다.
    print("input path is ",path)
    path = pyastar2d.astar_path(path, [start_x,start_y], [goal_x,goal_y], allow_diagonal=True)
    smoothing_path =gradient.smooth(path)
    return smoothing_path