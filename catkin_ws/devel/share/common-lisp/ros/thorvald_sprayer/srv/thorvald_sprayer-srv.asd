
(cl:in-package :asdf)

(defsystem "thorvald_sprayer-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sprayer_controller" :depends-on ("_package_sprayer_controller"))
    (:file "_package_sprayer_controller" :depends-on ("_package"))
  ))