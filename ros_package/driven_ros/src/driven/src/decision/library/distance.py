import math

def farest_distance_point(map,x,y):

    farest_point = [x,y]
    farest_dist = 0
    tmp_dist=0
    tmp_point=[0,0]
    second_point = [x,y]
    second_dist = 0

    for i in range(50):
        for j in range(50):
            if map[i][j]==1:
                    test_dist = math.sqrt( (i - farest_point[0])**2 + (j - farest_point[1])**2 )
                    #test_dist = math.dist(farest_point,[i,j])
                    if farest_dist < test_dist:
                         tmp_dist=farest_dist
                         farest_dist = test_dist
                         second_dist = tmp_dist
                        
                         tmp_point = farest_point
                         farest_point = [i,j]
                         second_point = tmp_point

                    elif farest_dist >= test_dist and second_dist < test_dist:
                         second_dist = test_dist
                         second_point = [i,j]

    
    return farest_point, second_point

if __name__=="__main__":
     a=[1,1]
     b=[2,2]

     print(math.sqrt( (b[0] - a[0])**2 + (b[1] - a[1])**2 ))
