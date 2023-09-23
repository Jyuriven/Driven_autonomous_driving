//Linear


#include <ros.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Bool.h>

ros::NodeHandle nh;


#define INTL2 2 //GO
#define INTL1 3 //BACK -> mega pin is broken!
#define ACTUATOR_PIN 4

int now_delay = 2400;

int act_delay = 0;
int act_delay_real = 0;
int act_delay_real_after = 0;
bool actD1 = true;
bool actD2 = true;


#define CAR_MODE 5
bool car_state = true;
bool car_signal = true;


#define HST1 6
#define HST2 7
bool h_signal_1 = false;
bool h_signal_2 = true;
bool h_cnt1 = false;
bool h_cnt2 = true;

#define EST 8
bool EST_signal = false;
bool EST_cnt = false;

bool state_cnt_on = true;
bool state_cnt_off = true;




void actuatorDelayCallback(const std_msgs::UInt16& msg) {
  act_delay = msg.data; 
}


//input
ros::Subscriber<std_msgs::UInt16> actuator_delay_sub("act_d", actuatorDelayCallback);  




void setup() {
  nh.initNode();
  nh.subscribe(actuator_delay_sub);

  Serial.begin(57600);

  pinMode(INTL1, OUTPUT);
  pinMode(INTL2, OUTPUT);
  pinMode(ACTUATOR_PIN, OUTPUT);

  pinMode(CAR_MODE, INPUT_PULLUP);
  pinMode(HST1, INPUT_PULLUP);
  pinMode(HST2, INPUT_PULLUP);
  pinMode(EST, INPUT_PULLUP);

  Calibration(true);
}



void loop() {
  nh.spinOnce();
  delay(100);
////////////////////STOP PAGE////////////////////////////////////////////
  //car_signal = digitalRead(CAR_MODE);
  h_signal_1 = digitalRead(HST1);
  h_signal_2 = digitalRead(HST2);
  //EST_signal = digitalRead(EST);

  Signal(car_signal, h_signal_1, h_signal_2, EST_signal);

  /*
  Serial.print(car_state);
  Serial.print(h_cnt1);
  Serial.print(h_cnt2);
  Serial.println(EST_cnt);
  */  
////////////////////STOP PAGE////////////////////////////////////////////    

  act_delay_real = ((act_delay*24)+2400)-now_delay;
    
  if(car_state == false){
     if(state_cnt_off == true){
      Calibration(true);
      state_cnt_on = true;
      state_cnt_off = false;
     }
    }

  else if(car_state == true){
    if((h_cnt1 == true && h_cnt2 == false) || (EST_cnt == true)){      
       if(state_cnt_on == true){
        Stop(true);
        Stop(false);
        state_cnt_on = false;
        state_cnt_off = true;
       }
      }
       
    else if(h_cnt2 == true && h_cnt1 == false && (EST_cnt == false)){                
        
        if(act_delay_real == 0){
          analogWrite(ACTUATOR_PIN, 0);
         }
        else if(act_delay_real >> act_delay_real_after){
           digitalWrite(INT2,HIGH);
           digitalWrite(INT1,LOW);
           analogWrite(ACTUATOR_PIN, 255);
           delay(act_delay_real);
           analogWrite(ACTUATOR_PIN, 0);
           act_delay_real_after = act_delay_real;
           now_delay = now_delay + act_delay_real;
        }
        
        else if(act_delay_real << act_delay_real_after){
           act_delay_real *= -1;
           
           digitalWrite(INT1,HIGH);
           digitalWrite(INT2,LOW);
           analogWrite(ACTUATOR_PIN, 255);
           delay(act_delay_real);
           analogWrite(ACTUATOR_PIN, 0);
           act_delay_real_after = act_delay_real;
           now_delay = now_delay - act_delay_real;           
        }
        state_cnt_on = true;
        state_cnt_off = true;
    }
  }
}












void Signal(bool a, bool b, bool c, bool d){
  /*
  if(a == true){
      car_state = true;
    }

  else if(a == false){
      car_state = false;
    }
  */
  if(b == true){
      h_cnt2 = true;
      h_cnt1 = false;
     }
    
  else if(c == true){
      h_cnt2 = false;
      h_cnt1 = true;
    }
  /*
  if(d == true){
      EST_cnt = false;
     }
    
  else if(d == false){
      EST_cnt = true;
    }
  */

  return;
  }



void Linear(int x){
        act_delay_real = ((x*24)+2400)-now_delay;    
        
        if(act_delay_real == 0){
          analogWrite(ACTUATOR_PIN, 0);
         }
        else if(act_delay_real >> act_delay_real_after){
           digitalWrite(INT2,HIGH);
           digitalWrite(INT1,LOW);
           analogWrite(ACTUATOR_PIN, 255);
           delay(act_delay_real);
           analogWrite(ACTUATOR_PIN, 0);
           act_delay_real_after = act_delay_real;
           now_delay = now_delay + act_delay_real;
        }
        
        else if(act_delay_real << act_delay_real_after){
           act_delay_real *= -1;
           
           digitalWrite(INT1,HIGH);
           digitalWrite(INT2,LOW);
           analogWrite(ACTUATOR_PIN, 255);
           delay(act_delay_real);
           analogWrite(ACTUATOR_PIN, 0);
           act_delay_real_after = act_delay_real;
           now_delay = now_delay - act_delay_real;           
        }
  return;
  }



void Stop(bool x){

  if(x == true){
      digitalWrite(INTL2, HIGH); // GO
      digitalWrite(INTL1, LOW);
      analogWrite(ACTUATOR_PIN, 255); 
      delay(1000);
      analogWrite(ACTUATOR_PIN, 0);
    }
  else if(x == false){
      digitalWrite(INTL1, HIGH); //BACK
      digitalWrite(INTL2, LOW);
      analogWrite(ACTUATOR_PIN, 255);
      delay(1000);
      analogWrite(ACTUATOR_PIN, 0);
    }
  return;
  }



void Calibration(bool x){

  if(x == true){
      digitalWrite(INTL1, HIGH); //BACK
      digitalWrite(INTL2, LOW);
      analogWrite(ACTUATOR_PIN, 255);
      delay(5000);
      analogWrite(ACTUATOR_PIN, 0);
      digitalWrite(INTL2, HIGH); // GO
      digitalWrite(INTL1, LOW);
      analogWrite(ACTUATOR_PIN, 255); 
      delay(2400);
      analogWrite(ACTUATOR_PIN, 0);
    }    
  return;
  }