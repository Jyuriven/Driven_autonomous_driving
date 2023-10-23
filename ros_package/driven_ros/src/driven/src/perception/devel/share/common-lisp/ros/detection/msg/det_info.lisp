; Auto-generated. Do not edit!


(cl:in-package detection-msg)


;//! \htmlinclude det_info.msg.html

(cl:defclass <det_info> (roslisp-msg-protocol:ros-message)
  ((emg_stop
    :reader emg_stop
    :initarg :emg_stop
    :type cl:fixnum
    :initform 0)
   (stop_rate
    :reader stop_rate
    :initarg :stop_rate
    :type cl:fixnum
    :initform 0))
)

(cl:defclass det_info (<det_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <det_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'det_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detection-msg:<det_info> is deprecated: use detection-msg:det_info instead.")))

(cl:ensure-generic-function 'emg_stop-val :lambda-list '(m))
(cl:defmethod emg_stop-val ((m <det_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detection-msg:emg_stop-val is deprecated.  Use detection-msg:emg_stop instead.")
  (emg_stop m))

(cl:ensure-generic-function 'stop_rate-val :lambda-list '(m))
(cl:defmethod stop_rate-val ((m <det_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detection-msg:stop_rate-val is deprecated.  Use detection-msg:stop_rate instead.")
  (stop_rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <det_info>) ostream)
  "Serializes a message object of type '<det_info>"
  (cl:let* ((signed (cl:slot-value msg 'emg_stop)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'stop_rate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <det_info>) istream)
  "Deserializes a message object of type '<det_info>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'emg_stop) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stop_rate) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<det_info>)))
  "Returns string type for a message object of type '<det_info>"
  "detection/det_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'det_info)))
  "Returns string type for a message object of type 'det_info"
  "detection/det_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<det_info>)))
  "Returns md5sum for a message object of type '<det_info>"
  "8fe94a38075b37159e1d95c90bacc07a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'det_info)))
  "Returns md5sum for a message object of type 'det_info"
  "8fe94a38075b37159e1d95c90bacc07a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<det_info>)))
  "Returns full string definition for message of type '<det_info>"
  (cl:format cl:nil "int16 emg_stop~%int16 stop_rate~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'det_info)))
  "Returns full string definition for message of type 'det_info"
  (cl:format cl:nil "int16 emg_stop~%int16 stop_rate~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <det_info>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <det_info>))
  "Converts a ROS message object to a list"
  (cl:list 'det_info
    (cl:cons ':emg_stop (emg_stop msg))
    (cl:cons ':stop_rate (stop_rate msg))
))
