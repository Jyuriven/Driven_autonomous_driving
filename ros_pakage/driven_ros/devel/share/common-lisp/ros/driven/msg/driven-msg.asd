
(cl:in-package :asdf)

(defsystem "driven-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "jet2ard" :depends-on ("_package_jet2ard"))
    (:file "_package_jet2ard" :depends-on ("_package"))
  ))