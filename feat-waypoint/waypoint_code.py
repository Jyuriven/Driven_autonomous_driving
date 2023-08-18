import serial
from math import atan

file_path = 'C:/Users/ping8/Driven_autonomous_driving/feat-waypoint/gps.txt'  
###변수들 초기화해놓기 => 안해도 되는건지는 잘 모르겠음. but 안하면 에러뜸
gps_data = {}
num =0
data = {}
latitude = {} #위도
longitude = {} #경도
hadding = {} #차방향

### connect imu 연결 -> 굳이 여기서? 

### 데이터가 있을 경우 gps값들을 가져오는 메소드
def gpsdata(file_path, gps_data,latitude, longitude):
    f = open(file_path, 'r')
    data[num] = (f.readline).split(',')
    latitude[num] = data[2]  # 위도 => 몇번째 데이터인지는 확인이 필요함
    longitude[num] = data[4] # 경도

###데이터가 없을 경우 새로운 gps값들을 입력해주기 위한 메소드
def no_waypoint_data(file_path): 
    f = open(file_path, 'w')
    try:
        while True:
            line = ser.readline().decode('utf-8').strip()
            if line.startswith('$GNGGA'):  # NMEA 문장에 따라 수정해야 할 수 있음
                f.write(line)
    except KeyboardInterrupt:  
        ser.close()
          # 프로그램 종료 시 시리얼 포트 닫기
    f.close()
###파일이 비어있는지 확인하는 메소드
def empty_file(file_path):
    with open(file_path, 'r') as file:
        first_character = file.read(1)
        return first_character  # 파일의 첫 번째 문자가 없으면 파일이 비어있음

### publisher로 데이터 전송해주기.

### gps 데이터 추출하기
        ### 현재 바퀴가 보고있는 방향구하기.
### gps에서 추출한 데이터를 
### control -> 맵도 그릴줄 알아야 하나?
### imu의 yaw데이터 이용해주기

#main

### connect gps
### 시리얼 넘버를 이용해서 통신해주기.
### 밑에 값들은 수정해주기.
serial_port = '/dev/ttyUSB0'
baud_rate = 9600
ser = serial.Serial(serial_port, baud_rate, timeout=1) #시리얼 포트를 연결해주는 명령어 


if empty_file(file_path): ### 파일이 비어있는지 확인
    ###컨트롤하거나 mapping이 필요함
    ###현재 단계에서는 간단한 comtrol로 마무리하는 걸로
    gpsdata(file_path, gps_data,latitude, longitude)
    i = 0
    while True:
        
        
        line = ser.readline().decode('utf-8').strip()        
        realtime_gps = line.split(',')
        realtime_longitude = realtime_gps[2] #실시간 위도
        realtime_latitude = realtime_gps[4] #실시간 경도

        ###차가 욺직일 방향을 구해야하므로 atan을 이용해준다.
        angle = atan(longitude[i] - realtime_longitude) / (latitude[i+1] - realtime_latitude) 
        ### imu의 yaw데이터와 비교해서 해딩값 조절

        hadding=0 # 데이터를 어떻게 받아올 수 있을지 알아보기.
        ### 아두이노 통신
        
        ### while문 탈출 조건이 목적지 도착
        if line == '\0':
            ser.close()
else:  
    #기존에 데이터가 없을 때 새로운 데이터를 가져오기 위한 순서
    no_waypoint_data(file_path)