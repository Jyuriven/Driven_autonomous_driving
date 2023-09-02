
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

    roll = float(words[data_index])
    pitch = float(words[data_index + 1])
    yaw = float(words[data_index + 2])

    
    print("roll : ",int(roll))
    print("pitch :", int(pitch))
    print("yaw rate :",int(yaw))
    
    return roll,pitch,yaw
    
if __name__ =="__main__":
        
    comport_num = input("COM Port: ")
    comport_num = 'COM' + comport_num
    comport_baudrate = int(input("Baudrate: "))
    ser = serial.Serial(port=comport_num, baudrate=comport_baudrate)
    
    
    while True:
        line = ser.readline()
        print(line)
        words = line.decode('utf-8').split(",")
        
        data_index = 1
        

        roll = float(words[data_index])
        pitch = float(words[data_index + 1])
        yaw = float(words[data_index + 2])

        
        print("roll : ",int(roll))
        print("pitch :", int(pitch))
        print("yaw rate :",int(yaw))
        
    # time.sleep(1)
        

    ser.close()
