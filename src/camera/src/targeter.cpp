#include <ros/ros.h>
//#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <camera/BoundBox.h>
#include <camera/BoundImage.h>

sensor_msgs::Image latestImg;
ros::Publisher pub;
ros::Rate *r;

using namespace camera;

void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    try{
        cv::imshow("current image", cv_bridge::toCvShare(msg, "bgr8")->image);
    }catch (cv_bridge::Exception& e){
        ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
    }

    latestImg = *msg;
}

void inputCallback(const BoundBox::ConstPtr& box){
  camera::BoundImage msg;
  msg.img = latestImg;
  msg.box = *box;
  pub.publish(msg);
  r->sleep();
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "image_listener");
  ros::NodeHandle nh_img;

  cv::namedWindow("current image");
  cv::startWindowThread();

  ros::Subscriber sub = nh_img.subscribe("image_raw", 1, imageCallback);
  ros::NodeHandle nh_pub;
  ros::Rate temp(10);
  r = &temp;
  pub = nh_pub.advertise<BoundBox>("bound_img",10);
  ros::NodeHandle nh_input;
  ros::Subscriber input = nh_input.subscribe("user_input", 5, inputCallback);
  ros::spin();

  cv::destroyWindow("current image");
}
