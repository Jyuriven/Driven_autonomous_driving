import random
import time

# 모션 플래닝 큐 리스트 초기화
motion_planning__steering_queue = [0,5,10,15,20,18,17,16,14,13,12,10,15,17,18,19,21,23,25,26]
motion_planning_vel_queue = [0,5,6,9,15,20,21,23,25,24,15,13,10,12,14,16,19,20,23,24]

def main():
    return motion_planning__steering_queue.pop(0), motion_planning_vel_queue.pop(0)

if __name__ == "__main__":
    for i in range(20):
        x,y=main()
        print("steering: ",x,"vel: ",y)
        time.sleep(1)