
(cl:in-package :asdf)

(defsystem "detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "det_info" :depends-on ("_package_det_info"))
    (:file "_package_det_info" :depends-on ("_package"))
  ))