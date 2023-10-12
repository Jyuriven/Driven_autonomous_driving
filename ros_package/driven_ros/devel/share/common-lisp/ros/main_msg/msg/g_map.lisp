; Auto-generated. Do not edit!


(cl:in-package main_msg-msg)


;//! \htmlinclude g_map.msg.html

(cl:defclass <g_map> (roslisp-msg-protocol:ros-message)
  ((x_lst
    :reader x_lst
    :initarg :x_lst
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (y_lst
    :reader y_lst
    :initarg :y_lst
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (car_x
    :reader car_x
    :initarg :car_x
    :type cl:fixnum
    :initform 0)
   (car_y
    :reader car_y
    :initarg :car_y
    :type cl:fixnum
    :initform 0))
)

(cl:defclass g_map (<g_map>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <g_map>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'g_map)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name main_msg-msg:<g_map> is deprecated: use main_msg-msg:g_map instead.")))

(cl:ensure-generic-function 'x_lst-val :lambda-list '(m))
(cl:defmethod x_lst-val ((m <g_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_msg-msg:x_lst-val is deprecated.  Use main_msg-msg:x_lst instead.")
  (x_lst m))

(cl:ensure-generic-function 'y_lst-val :lambda-list '(m))
(cl:defmethod y_lst-val ((m <g_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_msg-msg:y_lst-val is deprecated.  Use main_msg-msg:y_lst instead.")
  (y_lst m))

(cl:ensure-generic-function 'car_x-val :lambda-list '(m))
(cl:defmethod car_x-val ((m <g_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_msg-msg:car_x-val is deprecated.  Use main_msg-msg:car_x instead.")
  (car_x m))

(cl:ensure-generic-function 'car_y-val :lambda-list '(m))
(cl:defmethod car_y-val ((m <g_map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_msg-msg:car_y-val is deprecated.  Use main_msg-msg:car_y instead.")
  (car_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <g_map>) ostream)
  "Serializes a message object of type '<g_map>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'x_lst))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'x_lst))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'y_lst))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'y_lst))
  (cl:let* ((signed (cl:slot-value msg 'car_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'car_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <g_map>) istream)
  "Deserializes a message object of type '<g_map>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'x_lst) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'x_lst)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'y_lst) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'y_lst)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'car_x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'car_y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<g_map>)))
  "Returns string type for a message object of type '<g_map>"
  "main_msg/g_map")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'g_map)))
  "Returns string type for a message object of type 'g_map"
  "main_msg/g_map")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<g_map>)))
  "Returns md5sum for a message object of type '<g_map>"
  "841c3629304d075e0a764e23d33792d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'g_map)))
  "Returns md5sum for a message object of type 'g_map"
  "841c3629304d075e0a764e23d33792d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<g_map>)))
  "Returns full string definition for message of type '<g_map>"
  (cl:format cl:nil "int64[] x_lst~%int64[] y_lst~%int16 car_x~%int16 car_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'g_map)))
  "Returns full string definition for message of type 'g_map"
  (cl:format cl:nil "int64[] x_lst~%int64[] y_lst~%int16 car_x~%int16 car_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <g_map>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'x_lst) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'y_lst) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <g_map>))
  "Converts a ROS message object to a list"
  (cl:list 'g_map
    (cl:cons ':x_lst (x_lst msg))
    (cl:cons ':y_lst (y_lst msg))
    (cl:cons ':car_x (car_x msg))
    (cl:cons ':car_y (car_y msg))
))
