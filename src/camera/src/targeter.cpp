#include <ros/ros.h>
//#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <camera/BoundBox.h>
#include <camera/BoundImage.h>
#include <std_msgs/Bool.h>

using namespace camera;

BoundBox inBox;
BoundBox outBox;
bool hasNewTarget = false;
bool tracker_initialized = false;
ros::Publisher pub;
ros::Rate *r;

void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    try{
        cv::Mat frame = cv_bridge::toCvShare(msg, "bgr8")->image;
        if(tracker_initialized){
            cv::rectangle(frame,
                          cv::Point(outBox.x,outBox.y),
                          cv::Point(outBox.x + outBox.w,
                                    outBox.y + outBox.h),
                          cv::Scalar(255,0,0));
        }
        if(hasNewTarget){
            cv::rectangle(frame,
                          cv::Point(inBox.x,inBox.y),
                          cv::Point(inBox.x + inBox.w,
                                    inBox.y + inBox.h),
                          cv::Scalar(0,0,255));
        }
            cv::imshow("current image", frame);
    }catch (cv_bridge::Exception& e){
        ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
    }
    if(!tracker_initialized)
      return;
    //tracker update
    //outBox = tracker.currentbox stuff
    pub.publish(outBox);
}

void boxCallback(const BoundBox::ConstPtr& box){
    inBox = *box;
    hasNewTarget = true;
}

void okCallback(const std_msgs::BoolConstPtr& msg){
    if(msg->data){
        //init tracker
    }
    hasNewTarget = false;
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
  pub = nh_pub.advertise<BoundBox>("img_target",10);
  ros::NodeHandle nh_inbox;
  ros::Subscriber s_inBox = nh_inbox.subscribe("user_input", 10, boxCallback);
  ros::NodeHandle nh_ok;
  ros::Subscriber s_ok = nh_ok.subscribe("okgo", 10, okCallback);
  ros::spin();

  cv::destroyWindow("current image");
}
