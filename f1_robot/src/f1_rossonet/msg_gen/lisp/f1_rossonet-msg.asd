
(cl:in-package :asdf)

(defsystem "f1_rossonet-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "F1WriteServos" :depends-on ("_package_F1WriteServos"))
    (:file "_package_F1WriteServos" :depends-on ("_package"))
    (:file "F1Servos" :depends-on ("_package_F1Servos"))
    (:file "_package_F1Servos" :depends-on ("_package"))
    (:file "F1ReadServos" :depends-on ("_package_F1ReadServos"))
    (:file "_package_F1ReadServos" :depends-on ("_package"))
  ))