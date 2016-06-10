#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <dlib/image_processing.h>

array2d<unsigned char> img;

void processImage(const sensor_msgs::ImageConstPtr& msg){
	
}

int main(int argc, char **argv){
	
	/*
	 * Initialize the ROS and Node Handler/Image Transport
	 */
	ros::init(argc, argv, "dlib");
	ros::NodeHandle n;
	image_transport::ImageTransport it(nh);

	/*
	 * Subscribe to the imagedata thread
	 */
	image_transport::Subscriber sub=it.subscribe("imagedata", 1, processImage);

	/*
	 * Continually buffer and check
	 */
	ros::spin;
}
