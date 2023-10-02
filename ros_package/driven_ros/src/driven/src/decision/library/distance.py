import math

def farest_distance_point(main_map,x,y):

    farest_point = [x,y]
    farest_dist = 0
    tmp_dist=0
    tmp_point=[0,0]
    second_point = [x,y]
    second_dist = 0
    obstacles = []  # 모든 장애물의 위치와 거리를 저장할 리스트
    
    for i in range(len(main_map)):
        for j in range(len(main_map[i])):
            if main_map[i][j] == 1:
                # (i, j)가 장애물인 경우, 해당 장애물과의 거리를 계산하여 리스트에 추가합니다.
                d = math.sqrt( (i - x)**2 + (j - y)**2 )                
                obstacles.append(((i, j), d))

    # 거리에 따라 장애물을 정렬합니다.
    obstacles.sort(key=lambda x: x[1], reverse=True)

    if len(obstacles) >= 2:
        return obstacles[0][0], obstacles[1][0]
    elif len(obstacles) == 1:
        return obstacles[0][0], None
    else:
        return None, None

    '''
    for i in range(50):
        for j in range(50):
            if main_map[i][j]==1:
                    test_dist = math.sqrt( (i - farest_point[0])**2 + (j - farest_point[1])**2 )
                    #test_dist = math.dist(farest_point,[i,j])
                    if farest_dist < test_dist:
                         tmp_dist=farest_dist
                         farest_dist = test_dist
                         second_dist = tmp_dist
                        
                         tmp_point = farest_point
                         farest_point = [i,j]
                         second_point = tmp_point

                    elif farest_dist > test_dist and second_dist <= test_dist:
                         second_dist = test_dist
                         second_point = [i,j]

    
    return farest_point, second_point
    '''
if __name__=="__main__":
     a=[1,1]
     b=[2,2]

     print(math.sqrt( (b[0] - a[0])**2 + (b[1] - a[1])**2 ))
