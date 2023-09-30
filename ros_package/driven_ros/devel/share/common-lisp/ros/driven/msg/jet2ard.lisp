; Auto-generated. Do not edit!


(cl:in-package driven-msg)


;//! \htmlinclude jet2ard.msg.html

(cl:defclass <jet2ard> (roslisp-msg-protocol:ros-message)
  ((throttle
    :reader throttle
    :initarg :throttle
    :type cl:integer
    :initform 0)
   (brake
    :reader brake
    :initarg :brake
    :type cl:integer
    :initform 0)
   (stop_sign
    :reader stop_sign
    :initarg :stop_sign
    :type cl:integer
    :initform 0)
   (start_time
    :reader start_time
    :initarg :start_time
    :type cl:real
    :initform 0))
)

(cl:defclass jet2ard (<jet2ard>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <jet2ard>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'jet2ard)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name driven-msg:<jet2ard> is deprecated: use driven-msg:jet2ard instead.")))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <jet2ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:throttle-val is deprecated.  Use driven-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'brake-val :lambda-list '(m))
(cl:defmethod brake-val ((m <jet2ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:brake-val is deprecated.  Use driven-msg:brake instead.")
  (brake m))

(cl:ensure-generic-function 'stop_sign-val :lambda-list '(m))
(cl:defmethod stop_sign-val ((m <jet2ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:stop_sign-val is deprecated.  Use driven-msg:stop_sign instead.")
  (stop_sign m))

(cl:ensure-generic-function 'start_time-val :lambda-list '(m))
(cl:defmethod start_time-val ((m <jet2ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driven-msg:start_time-val is deprecated.  Use driven-msg:start_time instead.")
  (start_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <jet2ard>) ostream)
  "Serializes a message object of type '<jet2ard>"
  (cl:let* ((signed (cl:slot-value msg 'throttle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'brake)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'stop_sign)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'start_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'start_time) (cl:floor (cl:slot-value msg 'start_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <jet2ard>) istream)
  "Deserializes a message object of type '<jet2ard>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'throttle) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'brake) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stop_sign) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<jet2ard>)))
  "Returns string type for a message object of type '<jet2ard>"
  "driven/jet2ard")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'jet2ard)))
  "Returns string type for a message object of type 'jet2ard"
  "driven/jet2ard")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<jet2ard>)))
  "Returns md5sum for a message object of type '<jet2ard>"
  "66290710e2d0e64ff792d8d065b9d5a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'jet2ard)))
  "Returns md5sum for a message object of type 'jet2ard"
  "66290710e2d0e64ff792d8d065b9d5a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<jet2ard>)))
  "Returns full string definition for message of type '<jet2ard>"
  (cl:format cl:nil "int64 throttle~%int64 brake~%int64 stop_sign~%time start_time~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'jet2ard)))
  "Returns full string definition for message of type 'jet2ard"
  (cl:format cl:nil "int64 throttle~%int64 brake~%int64 stop_sign~%time start_time~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <jet2ard>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <jet2ard>))
  "Converts a ROS message object to a list"
  (cl:list 'jet2ard
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':brake (brake msg))
    (cl:cons ':stop_sign (stop_sign msg))
    (cl:cons ':start_time (start_time msg))
))
