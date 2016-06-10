; Auto-generated. Do not edit!


(cl:in-package camera-msg)


;//! \htmlinclude BoundImage.msg.html

(cl:defclass <BoundImage> (roslisp-msg-protocol:ros-message)
  ((img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (box
    :reader box
    :initarg :box
    :type camera-msg:BoundBox
    :initform (cl:make-instance 'camera-msg:BoundBox)))
)

(cl:defclass BoundImage (<BoundImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name camera-msg:<BoundImage> is deprecated: use camera-msg:BoundImage instead.")))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <BoundImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera-msg:img-val is deprecated.  Use camera-msg:img instead.")
  (img m))

(cl:ensure-generic-function 'box-val :lambda-list '(m))
(cl:defmethod box-val ((m <BoundImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera-msg:box-val is deprecated.  Use camera-msg:box instead.")
  (box m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundImage>) ostream)
  "Serializes a message object of type '<BoundImage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'box) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundImage>) istream)
  "Deserializes a message object of type '<BoundImage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'box) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundImage>)))
  "Returns string type for a message object of type '<BoundImage>"
  "camera/BoundImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundImage)))
  "Returns string type for a message object of type 'BoundImage"
  "camera/BoundImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundImage>)))
  "Returns md5sum for a message object of type '<BoundImage>"
  "d07f7dcb39a73c0123b8e6fc14abd73b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundImage)))
  "Returns md5sum for a message object of type 'BoundImage"
  "d07f7dcb39a73c0123b8e6fc14abd73b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundImage>)))
  "Returns full string definition for message of type '<BoundImage>"
  (cl:format cl:nil "sensor_msgs/Image img~%camera/BoundBox box~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: camera/BoundBox~%int64 x~%int64 y~%int64 w~%int64 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundImage)))
  "Returns full string definition for message of type 'BoundImage"
  (cl:format cl:nil "sensor_msgs/Image img~%camera/BoundBox box~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: camera/BoundBox~%int64 x~%int64 y~%int64 w~%int64 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundImage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'box))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundImage>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundImage
    (cl:cons ':img (img msg))
    (cl:cons ':box (box msg))
))
