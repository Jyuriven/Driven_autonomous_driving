//SPG


#include <ros.h>
#include <std_msgs/UInt16.h>

ros::NodeHandle nh;


#define INTS1 2  //CW
#define INTS2 3  //CCW
#define STEERING_PIN 4 //PWM
int SPG_Speed = 0;
int SPG_Direction = 0;
int PT = 0;

int mini = 400;
int mid = 450;
int maxi = 500;


#define CAR_MODE 5 // Auto mode
bool car_state = true;
bool car_signal = true;

#define HST1 6
#define HST2 7
bool h_signal_1 = false;
bool h_signal_2 = false;
bool h_cnt1 = false;
bool h_cnt2 = false;

#define EST 8
bool EST_signal = false;
bool EST_cnt = false;

bool state_cnt_on = true;
bool state_cnt_off = false; 

bool cb = true;


void steeringCallback(const std_msgs::UInt16& msg) {
  SPG_Speed = msg.data;
}

void steeringDirectionCallback(const std_msgs::UInt16& msg) {
  SPG_Direction = msg.data;
}



//input
ros::Subscriber<std_msgs::UInt16> steering_sub("str_data", steeringCallback);
ros::Subscriber<std_msgs::UInt16> steering_direction_sub("str_d", steeringDirectionCallback);  


void setup() {
  
  nh.initNode();
  nh.subscribe(steering_sub);
  nh.subscribe(steering_direction_sub);  
  
  Serial.begin(57600);
  
  pinMode(INTS1, OUTPUT);
  pinMode(INTS2, OUTPUT);
  pinMode(STEERING_PIN, OUTPUT);

  pinMode(CAR_MODE, INPUT_PULLUP);
  pinMode(HST1, INPUT_PULLUP);
  pinMode(HST2, INPUT_PULLUP);
  pinMode(EST, INPUT_PULLUP);
  
  cb == true;
}



void loop() {
  //nh.spinOnce();
////////////////////STOP PAGE////////////////////////////////////////////
  car_signal = digitalRead(CAR_MODE);
  h_signal_1 = digitalRead(HST1);
  h_signal_2 = digitalRead(HST2);
  //EST_signal = digitalRead(EST);

  Signal(car_signal, h_signal_1, h_signal_2, EST_signal);

  Serial.print(car_state);
  Serial.print(h_cnt1);
  Serial.println(h_cnt2);
  Serial.print(EST_cnt);

////////////////////STOP PAGE////////////////////////////////////////////

  PT = analogRead(A0);
  Serial.println(PT);


    if(cb == true){
        Calibration(true);
        cb == false;
      }


    else if(car_state == false){
         if(state_cnt_off == true){   
           Calibration(true);
           state_cnt_on = true;
           state_cnt_off = false;
         }
         Stop(true);
        }

  
    else if(car_state == true){
      if((h_cnt1 == true && h_cnt2 == false) || (EST_cnt == true)){
          if(state_cnt_on == true){
             Calibration(true);
             state_cnt_on = false;
             state_cnt_off = true;           
          }
          Stop(true);
        }
        
      else if((h_cnt2 == true && h_cnt1 == false) && (EST_cnt == false)){
            if((PT <= mini+5) || (PT >= maxi-5)){
                Stop(true);
              }

            else if(PT << (SPG_Direction)){
               if((PT >= (SPG_Direction-5))){
                Stop(true);
               }
               else{
                  Right(SPG_Speed);
               }
              }    
                    
            else if(PT >> (SPG_Direction)){
              if(PT <= (SPG_Direction+5)){
                Stop(true);
               }
               else{
                  Left(SPG_Speed);
               }
              }
                state_cnt_on = true;
                state_cnt_off = true;
             }  
  }
}














void Signal(bool a, bool b, bool c, bool d){
  if(a == true){
      car_state = true;
    }

  else if(a == false){
      car_state = false;
    }
    
  if(b == true){
      h_cnt2 = true;
      h_cnt1 = false;
     }
    
  else if(b == true){
      h_cnt2 = false;
      h_cnt1 = true;
    }
  /*
  if(c == true){
      EST_cnt = false;
     }
    
  else if(c == false){
      EST_cnt = true;
    }
  */

  return;
  }


void Left(int x){
  digitalWrite(INTS1, LOW);
  digitalWrite(INTS2, HIGH);
  analogWrite(STEERING_PIN, x);     
  
  return;
  }

void Right(int x){
  digitalWrite(INTS2, LOW);
  digitalWrite(INTS1, HIGH);
  analogWrite(STEERING_PIN, x);
  
  return;
  }



void Stop(bool x){
  analogWrite(STEERING_PIN, 0);
  return;
  }



void Calibration(bool x){
  if(x == true){
       analogWrite(STEERING_PIN, 0);
       digitalWrite(INTS1, HIGH);
       digitalWrite(INTS2, LOW);
       analogWrite(STEERING_PIN, 110);
       delay(3000);
       mini = PT;
       digitalWrite(INTS2, HIGH);
       digitalWrite(INTS1, LOW);
       analogWrite(STEERING_PIN, 110);
       delay(3000);
       maxi = PT;
       mid = (maxi + mini)/2;
       delay(1400);
    }
  return;
  }