#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <dlib/image_processing.h>

array2d<unsigned char> img;
correlation_tracker tracker;
bool firstTime = true;
ros::Rate r(5);
ros::Publisher pub;

void processImage(const sensor_msgs::ImageConstPtr& msg){
	if(firstTime){
		return;
    }

    loadImage(img,msg);
    tracker.update(img);

    camera::BoundBox toSend;
    drectangle pos = tracker.getPosition();
    toSend.w = pos.width;
    toSend.h = pos.height;
    toSend.x = (int64)pos.left;
    toSend.y = (int64)pos.top;
    pub.publish(toSend);
    r.sleep();
}

void targetImage(const camera::BoundImage::ConstPtr& msg){
    tracker.start_track(msg.img, centered_rect(
                        point(box.x+(box.w/2),box.y+(box.h/2)),box.w,box.h);
    firstTime = false;
}

int main(int argc, char **argv){
	
	/*
	 * Initialize the ROS and Node Handler/Image Transport
	 */
    ros::init(argc, argv, "tracker");
    ros::NodeHandle nh_raw;
    ros::NodeHandle nh_bound;
    ros::NodeHandle nh_pub;
    image_transport::ImageTransport it(nh_raw);

    pub = nh_pub.advertise<camera::BoundBox>("bound_box",200);

	//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\

	/*
	 * Subscribe to the imagedata thread
	 */
    image_transport::Subscriber sub_raw=it.subscribe("image_raw", 1, processImage);
    image_transport::Subscriber sub_bound=nh_bound.subscribe("bound_img", 1, targetImage);

	/*
	 * Continually buffer and check
	 */
	ros::spin;
}
