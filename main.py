from twist_controller import Controller

#메인 코드
def main():
    Throttle, Brake, Steering=Controller.control()
    print(Throttle,Brake,Steering)


if __name__ == "__main__":
    main()
