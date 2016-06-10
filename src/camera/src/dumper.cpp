#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>

using namespace std;

int main(int argc, char** argv)
{

  ros::init(argc, argv, "dumper");
  ros::NodeHandle nh;
  ros::NodeHandle err_nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("image_raw", 1);
  ros::Publisher err = err_nh.advertise<std_msgs::String>("logger_information", 1000);

  cv::VideoCapture cap(0);
  // Check if video device can be opened with the given index
  if(!cap.isOpened()){
      cout << "Error bra";
      return 1;
  }
  cv::Mat frame;
  sensor_msgs::ImagePtr msg;
  while (nh.ok()) {
    cap >> frame;
    // Check if grabbed frame is actually full with some content
    if(!frame.empty()) {
      msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
      pub.publish(msg);
      //cv::waitKey(1);
    }

    ros::spinOnce();
  }
}
