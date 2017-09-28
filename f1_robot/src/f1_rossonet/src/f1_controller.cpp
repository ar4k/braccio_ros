#include <ros/ros.h>
#include <ros/time.h>
#include <trajectory_msgs/JointTrajectoryPoint.h>
#include <trajectory_msgs/JointTrajectory.h>
#include <actionlib/server/simple_action_server.h>
#include <control_msgs/FollowJointTrajectoryAction.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float64.h>
#include <std_msgs/UInt16.h>
#include <sensor_msgs/Joy.h>
#include <sensor_msgs/JointState.h>

#define PI 3.14159265

class F1Robot
{
public:

  F1Robot(std::string name) :
    as_(nh_, name, false),
    action_name_(name)
  {
    as_.registerGoalCallback(boost::bind(&F1Robot::goalCB, this));
    as_.registerPreemptCallback(boost::bind(&F1Robot::preemptCB, this));

    sub_pose_arm1 = nh_.subscribe("/joint_1", 1, &F1Robot::fb, this);
    sub_pose_arm2 = nh_.subscribe("/joint_2", 1, &F1Robot::fb, this);
    sub_pose_arm3 = nh_.subscribe("/joint_3", 1, &F1Robot::fb, this);
    sub_pose_arm4 = nh_.subscribe("/joint_4", 1, &F1Robot::fb, this);

    servoa_pub_ = nh_.advertise<std_msgs::UInt16>("/joint_1", 1);
    servob_pub_ = nh_.advertise<std_msgs::UInt16>("/joint_2", 1);
    servoc_pub_ = nh_.advertise<std_msgs::UInt16>("/joint_3", 1);
    servod_pub_ = nh_.advertise<std_msgs::UInt16>("/joint_4", 1);

    servi_radiale = nh_.advertise<sensor_msgs::JointState>("/servi_radiale", 1);

    dega.data = 90;
    degb.data = 90;
    degc.data = 43;
    degd.data = 90;
    joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("/joy", 10, &F1Robot::joyCallback, this);

    as_.start();
  }

  ~F1Robot(void)
  {
  }

  void goalCB()
  {
    i_ = 0;
    goal_ = as_.acceptNewGoal()->trajectory;
    F1Robot::analysisCB();
  }

  void preemptCB()
  {
    ROS_INFO("%s: Preempted", action_name_.c_str());
    as_.setPreempted();
  }
  
  void fb(const std_msgs::UInt16::ConstPtr& valore)
  {
    F1Robot::analysisCB();
  }

  void analysisCB()
  {
    if (!as_.isActive())
      return;

    ros::Time ahora = ros::Time::now();
    feedback_.header.stamp = ahora;

    feedback_.joint_names.resize(4);
    feedback_.actual.positions.resize(4);
    feedback_.actual.effort.resize(4);

        for (int i = 0; i < 4; i++)
        {
                switch(i)
                {
                        case 0:
                                feedback_.joint_names[i] = "joint1";
                                feedback_.actual.positions[i] = -1*((dega.data-90)*PI/180);
                                feedback_.actual.effort[i] = 1;
                        break;
                        case 1:
                                feedback_.joint_names[i] = "joint2";
                                feedback_.actual.positions[i] = -1*((degb.data-90)*PI/180);
                                feedback_.actual.effort[i] = 1;
                        break;
                        case 2:
                                feedback_.joint_names[i] = "joint3";
                                feedback_.actual.positions[i] = ((degc.data-43)*PI/180);
                                feedback_.actual.effort[i] = 1;
                        break;
                        case 3:
                                feedback_.joint_names[i] = "joint4";
                                feedback_.actual.positions[i] = ((degd.data-90)*PI/180);
                                feedback_.actual.effort[i] = 1;
                        break;
                }
        }

        puntos_ = goal_.points.size();

        if (i_ != puntos_)
        {
                std_msgs::UInt16 move1;
                std_msgs::UInt16 move2;
                std_msgs::UInt16 move3;
                std_msgs::UInt16 move4;

                        if (i_ == 0
                            ||((feedback_.actual.positions[0] <= (goal_.points[i_-1].positions[0] + 0.1) && feedback_.actual.positions[0] >= (goal_.points[i_-1].positions[0] - 0.1))
                            && (feedback_.actual.positions[1] <= (goal_.points[i_-1].positions[1] + 0.1) && feedback_.actual.positions[1] >= (goal_.points[i_-1].positions[1] - 0.1))
                            && (feedback_.actual.positions[2] <= (goal_.points[i_-1].positions[2] + 0.1) && feedback_.actual.positions[2] >= (goal_.points[i_-1].positions[2] - 0.1))
                            && (feedback_.actual.positions[3] <= (goal_.points[i_-1].positions[3] + 0.1) && feedback_.actual.positions[3] >= (goal_.points[i_-1].positions[3] - 0.1))))
                        {
                                for (int j = 0; j < 4; j++)
                                {
                                        switch (j)
                                        {
                                        case 0:
                                                move1.data = 90-(goal_.points[i_].positions[j]*180/PI);
                                        break;
                                        case 1:
                                                move2.data = 90-(goal_.points[i_].positions[j]*180/PI);
                                        break;
                                        case 2:
                                                move3.data = 43+(goal_.points[i_].positions[j]*180/PI);
                                        break;
                                        case 3:
                                                move4.data = 90+(goal_.points[i_].positions[j]*180/PI);
                                        break;
                                        }
                                }

				servoa_pub_.publish(move1.data);
				servob_pub_.publish(move2.data);
				servoc_pub_.publish(move3.data);
				servod_pub_.publish(move4.data);
				dega.data=move1.data;
				degb.data=move2.data;
				degc.data=move3.data;
				degd.data=move4.data;
				F1Robot::pubblicaStato();
				
                                t_inicio = ros::Time::now();
                        }
                        else
                        {
                                i_ = i_ - 1;
                        }

                        ros::Time ahora = ros::Time::now();

                        ros::Duration duracion(2.0);

                        if (ahora > (t_inicio + duracion))
                        {
                                ROS_WARN("Goal annullato per timeout..");
                                result_.error_code = -1;
                                as_.setAborted(result_);
                        }

                        feedback_.desired = goal_.points[i_];

                        feedback_.error.positions.resize(4);

                        for (int j = 0; j < 4; j++)
                        {
                                feedback_.error.positions[j] = feedback_.desired.positions[j] - feedback_.actual.positions[j];
                        }

                i_ ++;
        }
        else
        {
                ROS_INFO("Goal centrato..");
                result_.error_code = 0;
                as_.setSucceeded(result_);
        }
        ROS_INFO("Feedback..");
        as_.publishFeedback(feedback_);
  }

protected:

  ros::NodeHandle nh_;
  actionlib::SimpleActionServer<control_msgs::FollowJointTrajectoryAction> as_;
  std::string action_name_;
  int puntos_, i_;
  ros::Time t_inicio;
  trajectory_msgs::JointTrajectory goal_;
  control_msgs::FollowJointTrajectoryResult result_;
  control_msgs::FollowJointTrajectoryFeedback feedback_;
  ros::Subscriber sub_pose_arm1;
  ros::Subscriber sub_pose_arm2;
  ros::Subscriber sub_pose_arm3;
  ros::Subscriber sub_pose_arm4;
  ros::Publisher servoa_pub_;
  ros::Publisher servob_pub_;
  ros::Publisher servoc_pub_;
  ros::Publisher servod_pub_;
  ros::Publisher servi_radiale;
  std_msgs::UInt16 dega;
  std_msgs::UInt16 degb;
  std_msgs::UInt16 degc;
  std_msgs::UInt16 degd; 
  ros::Subscriber joy_sub_;

private:

  void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);
  void pubblicaStato();
 
};
  
void F1Robot::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
  dega.data = 90-(joy->axes[0]*90);
  degb.data = 90-(joy->axes[1]*90);
  degc.data = 43+(joy->axes[4]*-137);
  degd.data = 90+(joy->axes[3]*90);
  servoa_pub_.publish(dega);
  servob_pub_.publish(degb);
  servoc_pub_.publish(degc);
  servod_pub_.publish(degd);
  F1Robot::pubblicaStato();
}

void F1Robot::pubblicaStato() {
  sensor_msgs::JointState valori;
  valori.header.stamp = ros::Time::now();
  valori.name.resize(4);
  valori.name[0] = "joint1";
  valori.name[1] = "joint2";
  valori.name[2] = "joint3";
  valori.name[3] = "joint4";
  valori.position.resize(4);
  valori.position[0] = -1*((dega.data-90)*PI/180);
  valori.position[1] = -1*((degb.data-90)*PI/180);
  valori.position[2] = (degc.data-43)*PI/180;
  valori.position[3] = (degc.data-90)*PI/180;
  servi_radiale.publish(valori);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "follow_joint_trajectory");
  F1Robot braccio(ros::this_node::getName());
  ros::spin();
  return 0;
}
