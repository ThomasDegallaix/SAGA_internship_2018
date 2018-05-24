
(cl:in-package :asdf)

(defsystem "thorvald_sprayer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CANFrame" :depends-on ("_package_CANFrame"))
    (:file "_package_CANFrame" :depends-on ("_package"))
    (:file "feedbackData" :depends-on ("_package_feedbackData"))
    (:file "_package_feedbackData" :depends-on ("_package"))
  ))