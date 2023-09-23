import serial

# 시리얼 포트 및 속도 설정
ser = serial.Serial('COM3', 460800)  # 'COMx'를 실제 포트 이름으로 변경하세요.

# RTK 메시지 수신을 위한 설정 (u-blox의 경우)
ser.write(b'\xB5\x62\x06\x71\x08\x00\x01\x00\x03\x00\x00\x00\x00\x00\xB5\x62\x06\x71\x08\x00\x01\x01\x03\x0B') 

try:
    while True:
        # 시리얼 포트에서 데이터 읽기
        data = ser.readline()
        
        # NMEA 메시지인지 확인
        if data.startswith(b'$GPGGA') or data.startswith(b'$GNGGA'):
            # 데이터를 쉼표로 분리
            fields = data.split(b',')
            
            # 필요한 정보 추출
            if len(fields) >= 15 and fields[2] and fields[4] and fields[9]:
                latitude = float(fields[2])  # Latitude
                longitude = float(fields[4])  # Longitude
                altitude = float(fields[9])  # Altitude
                
                # 추출한 정보 출력
                print(f"위도: {latitude}, 경도: {longitude}, 고도: {altitude}")
except KeyboardInterrupt:
    # 프로그램 종료 시 시리얼 포트 닫기
    ser.close()
