;; Auto-generated. Do not edit!


(when (boundp 'detection::det_info)
  (if (not (find-package "DETECTION"))
    (make-package "DETECTION"))
  (shadow 'det_info (find-package "DETECTION")))
(unless (find-package "DETECTION::DET_INFO")
  (make-package "DETECTION::DET_INFO"))

(in-package "ROS")
;;//! \htmlinclude det_info.msg.html


(defclass detection::det_info
  :super ros::object
  :slots (_emg_stop _stop_rate ))

(defmethod detection::det_info
  (:init
   (&key
    ((:emg_stop __emg_stop) 0)
    ((:stop_rate __stop_rate) 0)
    )
   (send-super :init)
   (setq _emg_stop (round __emg_stop))
   (setq _stop_rate (round __stop_rate))
   self)
  (:emg_stop
   (&optional __emg_stop)
   (if __emg_stop (setq _emg_stop __emg_stop)) _emg_stop)
  (:stop_rate
   (&optional __stop_rate)
   (if __stop_rate (setq _stop_rate __stop_rate)) _stop_rate)
  (:serialization-length
   ()
   (+
    ;; int16 _emg_stop
    2
    ;; int16 _stop_rate
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _emg_stop
       (write-word _emg_stop s)
     ;; int16 _stop_rate
       (write-word _stop_rate s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _emg_stop
     (setq _emg_stop (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _stop_rate
     (setq _stop_rate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get detection::det_info :md5sum-) "8fe94a38075b37159e1d95c90bacc07a")
(setf (get detection::det_info :datatype-) "detection/det_info")
(setf (get detection::det_info :definition-)
      "int16 emg_stop
int16 stop_rate
")



(provide :detection/det_info "8fe94a38075b37159e1d95c90bacc07a")


