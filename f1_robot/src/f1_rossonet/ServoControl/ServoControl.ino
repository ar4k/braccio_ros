/*
 * rosserial Servo Control
 *
 * by Ambrosini Rossonet s.c.a r.l.
 */

#if (ARDUINO >= 100)
 #include <Arduino.h>
#else
 #include <WProgram.h>
#endif

#define USE_USBCON
#include <Servo.h> 
#include <ros.h>
#include <std_msgs/UInt16.h>

ros::NodeHandle nh;

Servo link0;
Servo link1a;
Servo link1b;
Servo link2a;
Servo link2b;
Servo link3;

void link_cb0( const std_msgs::UInt16& cmd_msg){
  link0.write(cmd_msg.data); //set servo angle, should be from 0-180   
}
void link_cb1( const std_msgs::UInt16& cmd_msg){
  link1a.write(cmd_msg.data); //set servo angle, should be from 0-180    
  int inverso = 180 - cmd_msg.data;
  link1b.write(inverso);
}
void link_cb2( const std_msgs::UInt16& cmd_msg){
  link2a.write(cmd_msg.data); //set servo angle, should be from 0-180
  int inverso = 180 - cmd_msg.data;
  link2b.write(inverso);
}
void link_cb3( const std_msgs::UInt16& cmd_msg){
  link3.write(cmd_msg.data); //set servo angle, should be from 0-180  
}

ros::Subscriber<std_msgs::UInt16> sub0("joint_1", link_cb0);
ros::Subscriber<std_msgs::UInt16> sub1("joint_2", link_cb1);
ros::Subscriber<std_msgs::UInt16> sub2("joint_3", link_cb2);
ros::Subscriber<std_msgs::UInt16> sub3("joint_4", link_cb3);

void setup(){

  nh.initNode();
  nh.subscribe(sub0);
  nh.subscribe(sub1);
  nh.subscribe(sub2);
  nh.subscribe(sub3);
  
  link0.attach(7,900,2100);
  link1a.attach(8);
  link1b.attach(9);
  link2a.attach(10,800,2200);
  link2b.attach(11,800,2200);
  link3.attach(12);
  
}

void loop(){
  nh.spinOnce();
  delay(10);
}
