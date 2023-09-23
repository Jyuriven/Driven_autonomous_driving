//BLDC


/*
60 = 0%
65 = %
70 = %
75 = %
80 = %
85 = %
90 = %
95 = %
100 = %
105 = %
110 = %
115 = %
120 = %
125 = %
130 = %
135 = %
140 = %
145 = %
150 = %
155 = %
160 = %
165 = %
170 = %
175 = %
180 = %
 */ 

#include <ros.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Bool.h>

ros::NodeHandle nh;


#define BLDC_T 2
#define SPK 3
int val = 0;
int th_val = 0;
int BLDC_Speed = 0;
//bool B_state = false;


#define CAR_MODE 5 // Auto mode
bool car_state = true;
bool car_signal = true;


//e-stop
#define HST1 6
#define HST2 7
bool h_signal_1 = false;
bool h_signal_2 = false;
bool h_cnt1 = false;
bool h_cnt2 = false;

#define EST 8
bool EST_signal = false;
bool EST_cnt = false;



void bldcCallback(const std_msgs::UInt16& msg) {
  BLDC_Speed = msg.data;
}




//input
ros::Subscriber<std_msgs::UInt16> bldc_sub("bldc_data", bldcCallback);


void setup() {
  nh.initNode();
  nh.subscribe(bldc_sub);


  Serial.begin(57600);

  pinMode(SPK, OUTPUT);
  pinMode(BLDC_T, OUTPUT);
  
  pinMode(CAR_MODE, INPUT_PULLUP);

  pinMode(HST1, INPUT_PULLUP);
  pinMode(HST2, INPUT_PULLUP);
  pinMode(EST, INPUT_PULLUP);
}




void loop() {
  nh.spinOnce();
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
  val = analogRead(A0);
  th_val = val/4;
  Serial.println(th_val);



    if(car_state == false){
        analogWrite(BLDC_T, 25);
        analogWrite(SPK,th_val+70);
      }  //STOP

    else if(car_state == true){
      if((h_cnt1 == true && h_cnt2 == false) || (EST_cnt == true)){
         Stop(true);
        } //STOP

      
      else if(h_cnt2 == true && h_cnt1 == false && (EST_cnt == false)){           
         Go(BLDC_Speed);         
        } //NONSTOP
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



void Go(int x){
  analogWrite(BLDC_T, x);
  analogWrite(SPK,x+70);

  return;
  }


void Stop(bool x){
  analogWrite(BLDC_T, 25);
  analogWrite(SPK,80);
  
  return;
  }