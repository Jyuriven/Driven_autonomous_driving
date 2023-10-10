
(cl:in-package :asdf)

(defsystem "main_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "det_info" :depends-on ("_package_det_info"))
    (:file "_package_det_info" :depends-on ("_package"))
    (:file "g_map" :depends-on ("_package_g_map"))
    (:file "_package_g_map" :depends-on ("_package"))
    (:file "jet2ard" :depends-on ("_package_jet2ard"))
    (:file "_package_jet2ard" :depends-on ("_package"))
  ))