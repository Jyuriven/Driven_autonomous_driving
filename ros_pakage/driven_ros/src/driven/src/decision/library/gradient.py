import math
def smooth(path, weight_data = 0.5, weight_smooth = 0.1, tolerance = 0.00001):

    # Make a deep copy of path into newpath
    newpath = [[0 for col in range(len(path[0]))] for row in range(len(path))]
    for i in range(len(path)):
        for j in range(len(path[0])):
            newpath[i][j] = path[i][j]

    #### ENTER CODE BELOW THIS LINE ###
    change = 1
    while change > tolerance:
        change = 0
        for i in range(1,len(path)-1):
            for j in range(len(path[0])):
                ori = newpath[i][j]
                newpath[i][j] = newpath[i][j] + weight_data*(path[i][j]-newpath[i][j])
                newpath[i][j] = newpath[i][j] + weight_smooth*(newpath[i+1][j]+newpath[i-1][j]-2*newpath[i][j])
                change += abs(ori - newpath[i][j])
    
    return newpath # Leave this line for the grader!



def route2gradient(route,level=1): 
    ### OGM 맵에서 뽑아낸 최적의 경로를 Smoothing 하여 미분하여 지근거리 목표로 향하는 기울기를 반환한다.
    ### route : np.array(,float32)
    ### route : [[x1,y1],[x2,y2],[x3,y3],[x4,y4]]
    ### 
    new_smoothingPath  = smooth(route)

    gradient_set = [[]]

    return gradient_set


def calculate_radian(p1_x,p1_y,p2_x,p2_y):
    rad = math.atan2(p2_y-p1_y,p2_x,p1_x)
    print(rad)
    return rad

def rad2deg(rad):
    PI = math.pi
    deg = (rad*180)/PI
    return int(deg)