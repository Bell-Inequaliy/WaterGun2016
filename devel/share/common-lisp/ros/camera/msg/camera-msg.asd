
(cl:in-package :asdf)

(defsystem "camera-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundImage" :depends-on ("_package_BoundImage"))
    (:file "_package_BoundImage" :depends-on ("_package"))
    (:file "Target" :depends-on ("_package_Target"))
    (:file "_package_Target" :depends-on ("_package"))
    (:file "BoundBox" :depends-on ("_package_BoundBox"))
    (:file "_package_BoundBox" :depends-on ("_package"))
  ))