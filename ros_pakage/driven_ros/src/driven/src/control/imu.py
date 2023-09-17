import serial
import vpython
from math import sin,cos
from pyquaternion import Quaternion
import time


grad2rad = 3.141592/180.0
rad2grad = 180.0/3.141592


# ...
def quat_to_euler(x, y, z, w):
    euler = [0.0, 0.0, 0.0]
    
    # ...


def get_imu():
    ser = serial.Serial(port=comport_num, baudrate=comport_baudrate)
    line = ser.readline()
    words = line.decode('utf-8').split(",")
    data_index = 1

    ###데이터 입력###
    roll = float(words[data_index])
    pitch = float(words[data_index + 1])
    now_sec=time.time()
    yaw = float(words[data_index + 2])

    pre_sec=0
    pre_yaw=yaw
    ###각속도 연산 및 데이터 출력###
    yaw_angular=(yaw-pre_yaw)/(now_sec-pre_sec)
    print("roll : ",int(roll))
    print("pitch :", int(pitch))
    print("yaw rate :",int(yaw))
    print("yaw angular velocity :",int(yaw_angular))
        
    pre_sec=now_sec
    pre_yaw=yaw
    return roll,pitch,yaw,
    
if __name__ =="__main__":
        
    comport_num = input("COM Port: ")
    comport_num = '/dev/ttyUSB' + comport_num
    comport_baudrate = int(input("Baudrate: "))
    ser = serial.Serial(port=comport_num, baudrate=comport_baudrate)
    
    
    while True:
        get_imu()
        # time.sleep(1)
    #ser.close()