;; Auto-generated. Do not edit!


(when (boundp 'main_msg::g_map)
  (if (not (find-package "MAIN_MSG"))
    (make-package "MAIN_MSG"))
  (shadow 'g_map (find-package "MAIN_MSG")))
(unless (find-package "MAIN_MSG::G_MAP")
  (make-package "MAIN_MSG::G_MAP"))

(in-package "ROS")
;;//! \htmlinclude g_map.msg.html


(defclass main_msg::g_map
  :super ros::object
  :slots (_x_lst _y_lst _car_x _car_y ))

(defmethod main_msg::g_map
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
    ;; int64[] _x_lst
    (* 8    (length _x_lst)) 4
    ;; int64[] _y_lst
    (* 8    (length _y_lst)) 4
    ;; int16 _car_x
    2
    ;; int16 _car_y
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _x_lst
     (write-long (length _x_lst) s)
     (dotimes (i (length _x_lst))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _x_lst i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _x_lst i)) (= (length ((elt _x_lst i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _x_lst i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _x_lst i) . bv) 1) -1) s))
             ((and (class (elt _x_lst i)) (= (length ((elt _x_lst i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _x_lst i) . bv) 0) s)
              (write-long (if (>= (elt _x_lst i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _x_lst i) s)(write-long (if (>= (elt _x_lst i) 0) 0 #xffffffff) s)))
       )
     ;; int64[] _y_lst
     (write-long (length _y_lst) s)
     (dotimes (i (length _y_lst))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _y_lst i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _y_lst i)) (= (length ((elt _y_lst i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _y_lst i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _y_lst i) . bv) 1) -1) s))
             ((and (class (elt _y_lst i)) (= (length ((elt _y_lst i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _y_lst i) . bv) 0) s)
              (write-long (if (>= (elt _y_lst i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _y_lst i) s)(write-long (if (>= (elt _y_lst i) 0) 0 #xffffffff) s)))
       )
     ;; int16 _car_x
       (write-word _car_x s)
     ;; int16 _car_y
       (write-word _car_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _x_lst
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x_lst (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _x_lst i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _x_lst i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; int64[] _y_lst
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y_lst (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _y_lst i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _y_lst i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; int16 _car_x
     (setq _car_x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _car_y
     (setq _car_y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get main_msg::g_map :md5sum-) "841c3629304d075e0a764e23d33792d5")
(setf (get main_msg::g_map :datatype-) "main_msg/g_map")
(setf (get main_msg::g_map :definition-)
      "int64[] x_lst
int64[] y_lst
int16 car_x
int16 car_y

")



(provide :main_msg/g_map "841c3629304d075e0a764e23d33792d5")


