;; Auto-generated. Do not edit!


(when (boundp 'driven::jet2ard)
  (if (not (find-package "DRIVEN"))
    (make-package "DRIVEN"))
  (shadow 'jet2ard (find-package "DRIVEN")))
(unless (find-package "DRIVEN::JET2ARD")
  (make-package "DRIVEN::JET2ARD"))

(in-package "ROS")
;;//! \htmlinclude jet2ard.msg.html


(defclass driven::jet2ard
  :super ros::object
  :slots (_throttle _brake _stop_sign _start_time ))

(defmethod driven::jet2ard
  (:init
   (&key
    ((:throttle __throttle) 0)
    ((:brake __brake) 0)
    ((:stop_sign __stop_sign) 0)
    ((:start_time __start_time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _throttle (round __throttle))
   (setq _brake (round __brake))
   (setq _stop_sign (round __stop_sign))
   (setq _start_time __start_time)
   self)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:stop_sign
   (&optional __stop_sign)
   (if __stop_sign (setq _stop_sign __stop_sign)) _stop_sign)
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:serialization-length
   ()
   (+
    ;; int64 _throttle
    8
    ;; int64 _brake
    8
    ;; int64 _stop_sign
    8
    ;; time _start_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _throttle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _throttle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _throttle) (= (length (_throttle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_throttle . bv) 0) 0) s)
              (write-long (ash (elt (_throttle . bv) 1) -1) s))
             ((and (class _throttle) (= (length (_throttle . bv)) 1)) ;; big1
              (write-long (elt (_throttle . bv) 0) s)
              (write-long (if (>= _throttle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _throttle s)(write-long (if (>= _throttle 0) 0 #xffffffff) s)))
     ;; int64 _brake
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _brake (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _brake) (= (length (_brake . bv)) 2)) ;; bignum
              (write-long (ash (elt (_brake . bv) 0) 0) s)
              (write-long (ash (elt (_brake . bv) 1) -1) s))
             ((and (class _brake) (= (length (_brake . bv)) 1)) ;; big1
              (write-long (elt (_brake . bv) 0) s)
              (write-long (if (>= _brake 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _brake s)(write-long (if (>= _brake 0) 0 #xffffffff) s)))
     ;; int64 _stop_sign
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _stop_sign (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _stop_sign) (= (length (_stop_sign . bv)) 2)) ;; bignum
              (write-long (ash (elt (_stop_sign . bv) 0) 0) s)
              (write-long (ash (elt (_stop_sign . bv) 1) -1) s))
             ((and (class _stop_sign) (= (length (_stop_sign . bv)) 1)) ;; big1
              (write-long (elt (_stop_sign . bv) 0) s)
              (write-long (if (>= _stop_sign 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _stop_sign s)(write-long (if (>= _stop_sign 0) 0 #xffffffff) s)))
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _throttle
#+(or :alpha :irix6 :x86_64)
      (setf _throttle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _throttle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _brake
#+(or :alpha :irix6 :x86_64)
      (setf _brake (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _brake (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _stop_sign
#+(or :alpha :irix6 :x86_64)
      (setf _stop_sign (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _stop_sign (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get driven::jet2ard :md5sum-) "66290710e2d0e64ff792d8d065b9d5a8")
(setf (get driven::jet2ard :datatype-) "driven/jet2ard")
(setf (get driven::jet2ard :definition-)
      "int64 throttle
int64 brake
int64 stop_sign
time start_time
")



(provide :driven/jet2ard "66290710e2d0e64ff792d8d065b9d5a8")


