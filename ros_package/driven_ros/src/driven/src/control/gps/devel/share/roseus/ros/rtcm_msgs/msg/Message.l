;; Auto-generated. Do not edit!


(when (boundp 'rtcm_msgs::Message)
  (if (not (find-package "RTCM_MSGS"))
    (make-package "RTCM_MSGS"))
  (shadow 'Message (find-package "RTCM_MSGS")))
(unless (find-package "RTCM_MSGS::MESSAGE")
  (make-package "RTCM_MSGS::MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude Message.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rtcm_msgs::Message
  :super ros::object
  :slots (_header _message ))

(defmethod rtcm_msgs::Message
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:message __message) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _message __message)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8[] _message
    (* 1    (length _message)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8[] _message
     (write-long (length _message) s)
     (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8[] _message
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _message (make-array n :element-type :char))
     (replace _message buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get rtcm_msgs::Message :md5sum-) "883b1fb65b83ccf75497c21f2d63052d")
(setf (get rtcm_msgs::Message :datatype-) "rtcm_msgs/Message")
(setf (get rtcm_msgs::Message :definition-)
      "# A message representing a single RTCM message.
std_msgs/Header header

uint8[] message

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :rtcm_msgs/Message "883b1fb65b83ccf75497c21f2d63052d")


