import socket

class LidarConnection():
    '''
    Class to connect to a unity scene that has a Lidar with UDP connection.
    '''
    def __init__(self, ip, port):
        self.IP = ip
        self.PORT = port

        self.sock = socket.socket(socket.AF_INET, # Internet
                    socket.SOCK_DGRAM) # UDP
        self.sock.settimeout(2)

    def send_msg(self,msg):
        self.sock.sendto(msg.encode(), (self.IP, self.PORT))

    def recieve_lidar_dist(self):   
        self.send_msg("Hello UDP Server")
        msgFromServer, addr = self.sock.recvfrom(1024)

        msg_str = msgFromServer.decode()
        data_lst = msg_str.split(",")
        data_lst.remove(data_lst[len(data_lst)-1])      # remove the last element of the list (as it is empty)

        # print(data_lst)
        
        measurement_output = []  

        [measurement_output.append((float(data_lst[i+1]),float(data_lst[i]))) for i in range(len(data_lst)) if i % 2 == 0 and float(data_lst[i]) != 666]

        # [float_lst.append(float(i)) for i in data_lst]  # convert the list to have float elements
    
        # dist = min(float_lst)

        return measurement_output