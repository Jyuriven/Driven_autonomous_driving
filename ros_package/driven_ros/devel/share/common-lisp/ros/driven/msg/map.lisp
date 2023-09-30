; Auto-generated. Do not edit!


(cl:in-package driven-msg)


;//! \htmlinclude map.msg.html

(cl:defclass <map> (roslisp-msg-protocol:ros-message)
  ((x_lst
    :reader x_lst
    :initarg :x_lst
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (y_lst
    :reader y_lst
    :initarg :y_lst
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
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

(cl:defclass map (<map>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <map>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'map)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name driven-msg:<map> is deprecated: use driven-msg:map instead.")))

(cl:ensure-generic-function 'x_lst-val :lambda-list '(m))
(cl:defmethod x_lst-val ((m <map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:x_lst-val is deprecated.  Use driven-msg:x_lst instead.")
  (x_lst m))

(cl:ensure-generic-function 'y_lst-val :lambda-list '(m))
(cl:defmethod y_lst-val ((m <map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:y_lst-val is deprecated.  Use driven-msg:y_lst instead.")
  (y_lst m))

(cl:ensure-generic-function 'car_x-val :lambda-list '(m))
(cl:defmethod car_x-val ((m <map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:car_x-val is deprecated.  Use driven-msg:car_x instead.")
  (car_x m))

(cl:ensure-generic-function 'car_y-val :lambda-list '(m))
(cl:defmethod car_y-val ((m <map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:car_y-val is deprecated.  Use driven-msg:car_y instead.")
  (car_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <map>) ostream)
  "Serializes a message object of type '<map>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'x_lst))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'x_lst))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'y_lst))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <map>) istream)
  "Deserializes a message object of type '<map>"
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
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
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
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<map>)))
  "Returns string type for a message object of type '<map>"
  "driven/map")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'map)))
  "Returns string type for a message object of type 'map"
  "driven/map")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<map>)))
  "Returns md5sum for a message object of type '<map>"
  "97eb6427ffcca94f25feb3e4b16337f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'map)))
  "Returns md5sum for a message object of type 'map"
  "97eb6427ffcca94f25feb3e4b16337f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<map>)))
  "Returns full string definition for message of type '<map>"
  (cl:format cl:nil "int16[] x_lst~%int16[] y_lst~%int16 car_x~%int16 car_y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'map)))
  "Returns full string definition for message of type 'map"
  (cl:format cl:nil "int16[] x_lst~%int16[] y_lst~%int16 car_x~%int16 car_y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <map>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'x_lst) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'y_lst) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <map>))
  "Converts a ROS message object to a list"
  (cl:list 'map
    (cl:cons ':x_lst (x_lst msg))
    (cl:cons ':y_lst (y_lst msg))
    (cl:cons ':car_x (car_x msg))
    (cl:cons ':car_y (car_y msg))
))
