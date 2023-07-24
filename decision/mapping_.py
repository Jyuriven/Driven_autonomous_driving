'''
Ref. A-star planning
https://github.com/TThibeau/Lidar-Mapping-A-star-Path-Planning/blob/main/code/mapping_functions.py
'''

import numpy as np
import PIL as Image

def save_grid(grid,name):
    with open(f"Out\{name}.txt", "w") as file :
        np.savetxt(file,grid,fmt="%u")


def init_root_grid(height,width,resolution):

    ROWS,COLS = height*resolution,width*resolution

    if ROWS % 2 == 0: 
        ROWS += 1 # The grid should have odd sizes (to have a mid row)
    if COLS % 2 == 0: 
        COLS += 1 # The grid should have odd sizes (to have a mid col)
    
    main_grid = np.zeros((ROWS,COLS,3))

    return main_grid
    return 

def point_cloud_to_grid(pc,grid,res):
    '''
    이 함수는 Lidar 에서 가져온 데이터 Point Cloud 를 grid 로 매핑하는 함수입니다. 
    '''
    ROWS,COLS = len(grid),len(grid[0])

    mid_row_id = (ROWS-1)//2
    mid_col_id = (COLS-1)//2

    for p in pc:
        x = p[0]
        z = p[1]

        row = round(-z*res + mid_row_id)
        col = round(x*res + mid_col_id)

        try:
            grid[row][col] += 1
        except:
            print("this point is outside the global grid")

    return grid