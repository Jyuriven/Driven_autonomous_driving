;; Auto-generated. Do not edit!


(when (boundp 'cloud_msgs::map)
  (if (not (find-package "CLOUD_MSGS"))
    (make-package "CLOUD_MSGS"))
  (shadow 'map (find-package "CLOUD_MSGS")))
(unless (find-package "CLOUD_MSGS::MAP")
  (make-package "CLOUD_MSGS::MAP"))

(in-package "ROS")
;;//! \htmlinclude map.msg.html


(defclass cloud_msgs::map
  :super ros::object
  :slots (_x_lst _y_lst _car_x _car_y ))

(defmethod cloud_msgs::map
  (:init
   (&key
    ((:x_lst __x_lst) (make-array 0 :initial-element 0 :element-type :integer))
    ((:y_lst __y_lst) (make-array 0 :initial-element 0 :element-type :integer))
    ((:car_x __car_x) 0)
    ((:car_y __car_y) 0)
    )
   (send-super :init)
   (setq _x_lst __x_lst)
   (setq _y_lst __y_lst)
   (setq _car_x (round __car_x))
   (setq _car_y (round __car_y))
   self)
  (:x_lst
   (&optional __x_lst)
   (if __x_lst (setq _x_lst __x_lst)) _x_lst)
  (:y_lst
   (&optional __y_lst)
   (if __y_lst (setq _y_lst __y_lst)) _y_lst)
  (:car_x
   (&optional __car_x)
   (if __car_x (setq _car_x __car_x)) _car_x)
  (:car_y
   (&optional __car_y)
   (if __car_y (setq _car_y __car_y)) _car_y)
  (:serialization-length
   ()
   (+
    ;; int16[] _x_lst
    (* 2    (length _x_lst)) 4
    ;; int16[] _y_lst
    (* 2    (length _y_lst)) 4
    ;; int16 _car_x
    2
    ;; int16 _car_y
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _x_lst
     (write-long (length _x_lst) s)
     (dotimes (i (length _x_lst))
       (write-word (elt _x_lst i) s)
       )
     ;; int16[] _y_lst
     (write-long (length _y_lst) s)
     (dotimes (i (length _y_lst))
       (write-word (elt _y_lst i) s)
       )
     ;; int16 _car_x
       (write-word _car_x s)
     ;; int16 _car_y
       (write-word _car_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _x_lst
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x_lst (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _x_lst i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _y_lst
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y_lst (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _y_lst i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16 _car_x
     (setq _car_x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _car_y
     (setq _car_y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get cloud_msgs::map :md5sum-) "97eb6427ffcca94f25feb3e4b16337f3")
(setf (get cloud_msgs::map :datatype-) "cloud_msgs/map")
(setf (get cloud_msgs::map :definition-)
      "int16[] x_lst
int16[] y_lst
int16 car_x
int16 car_y

")



(provide :cloud_msgs/map "97eb6427ffcca94f25feb3e4b16337f3")


