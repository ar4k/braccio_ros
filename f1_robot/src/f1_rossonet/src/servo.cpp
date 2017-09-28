#include <ros/ros.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/Joy.h>


class Servo
{
public:
  Servo();

private:
  void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);

  std_msgs::UInt16 dega; 
  std_msgs::UInt16 degb; 
  std_msgs::UInt16 degc; 
  std_msgs::UInt16 degd;

  ros::NodeHandle nh_;

  ros::Publisher servoa_pub_;  
  ros::Publisher servob_pub_;  
  ros::Publisher servoc_pub_;  
  ros::Publisher servod_pub_;  

  ros::Subscriber joy_sub_;
};


Servo::Servo()  
{

  servoa_pub_ = nh_.advertise<std_msgs::UInt16>("joint_1", 1);
  servob_pub_ = nh_.advertise<std_msgs::UInt16>("joint_2", 1);
  servoc_pub_ = nh_.advertise<std_msgs::UInt16>("joint_3", 1);
  servod_pub_ = nh_.advertise<std_msgs::UInt16>("joint_4", 1);

  dega.data = 90;
  degb.data = 90;
  degc.data = 90;
  degd.data = 90;

  joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &Servo::joyCallback, this);
}  

void Servo::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
  dega.data = 90+(joy->axes[0]*90);
  degb.data = 90+(joy->axes[1]*90);
  degc.data = 90+(joy->axes[4]*90);
  degd.data = 90+(joy->axes[3]*90);
  servoa_pub_.publish(dega);
  servob_pub_.publish(degb);
  servoc_pub_.publish(degc);
  servod_pub_.publish(degd);
}


int main(int argc, char** argv) 
{
  ros::init(argc, argv, "servo_joy");
  Servo servo_joy;

  ros::spin();
}
