import socket

class UDPConnection():
    def __init__(self,ip,port):
        self.IP = ip
        self.PORT = port

        self.sock = socket.socket(socket.AF_INET, # Internet
                    socket.SOCK_DGRAM) # UDP

    def send_msg(self,msg):
        self.sock.sendto(msg.encode(), (self.IP, self.PORT))

    def get_vehicle_info(self):
        self.send_msg("")                       # Needs to send a message to receive feedback
        data, addr = self.sock.recvfrom(1024)
        data_str = data.decode()
        data_lst = data_str.split(",")

        x_cor = float(data_lst[0])
        z_cor = float(data_lst[1])
        heading = float(data_lst[2])

        return x_cor,z_cor,heading     # return x,z coordinates of vehicle