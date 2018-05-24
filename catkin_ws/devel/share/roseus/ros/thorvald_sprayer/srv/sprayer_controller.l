;; Auto-generated. Do not edit!


(when (boundp 'thorvald_sprayer::sprayer_controller)
  (if (not (find-package "THORVALD_SPRAYER"))
    (make-package "THORVALD_SPRAYER"))
  (shadow 'sprayer_controller (find-package "THORVALD_SPRAYER")))
(unless (find-package "THORVALD_SPRAYER::SPRAYER_CONTROLLER")
  (make-package "THORVALD_SPRAYER::SPRAYER_CONTROLLER"))
(unless (find-package "THORVALD_SPRAYER::SPRAYER_CONTROLLERREQUEST")
  (make-package "THORVALD_SPRAYER::SPRAYER_CONTROLLERREQUEST"))
(unless (find-package "THORVALD_SPRAYER::SPRAYER_CONTROLLERRESPONSE")
  (make-package "THORVALD_SPRAYER::SPRAYER_CONTROLLERRESPONSE"))

(in-package "ROS")





(defclass thorvald_sprayer::sprayer_controllerRequest
  :super ros::object
  :slots (_order _nodeID ))

(defmethod thorvald_sprayer::sprayer_controllerRequest
  (:init
   (&key
    ((:order __order) "")
    ((:nodeID __nodeID) 0)
    )
   (send-super :init)
   (setq _order (string __order))
   (setq _nodeID (round __nodeID))
   self)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:nodeID
   (&optional __nodeID)
   (if __nodeID (setq _nodeID __nodeID)) _nodeID)
  (:serialization-length
   ()
   (+
    ;; string _order
    4 (length _order)
    ;; uint32 _nodeID
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _order
       (write-long (length _order) s) (princ _order s)
     ;; uint32 _nodeID
       (write-long _nodeID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _order
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _order (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _nodeID
     (setq _nodeID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass thorvald_sprayer::sprayer_controllerResponse
  :super ros::object
  :slots (_message ))

(defmethod thorvald_sprayer::sprayer_controllerResponse
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass thorvald_sprayer::sprayer_controller
  :super ros::object
  :slots ())

(setf (get thorvald_sprayer::sprayer_controller :md5sum-) "d219122364590b6594a5c4f91ba561ca")
(setf (get thorvald_sprayer::sprayer_controller :datatype-) "thorvald_sprayer/sprayer_controller")
(setf (get thorvald_sprayer::sprayer_controller :request) thorvald_sprayer::sprayer_controllerRequest)
(setf (get thorvald_sprayer::sprayer_controller :response) thorvald_sprayer::sprayer_controllerResponse)

(defmethod thorvald_sprayer::sprayer_controllerRequest
  (:response () (instance thorvald_sprayer::sprayer_controllerResponse :init)))

(setf (get thorvald_sprayer::sprayer_controllerRequest :md5sum-) "d219122364590b6594a5c4f91ba561ca")
(setf (get thorvald_sprayer::sprayer_controllerRequest :datatype-) "thorvald_sprayer/sprayer_controllerRequest")
(setf (get thorvald_sprayer::sprayer_controllerRequest :definition-)
      "string order
uint32 nodeID
---
string message


")

(setf (get thorvald_sprayer::sprayer_controllerResponse :md5sum-) "d219122364590b6594a5c4f91ba561ca")
(setf (get thorvald_sprayer::sprayer_controllerResponse :datatype-) "thorvald_sprayer/sprayer_controllerResponse")
(setf (get thorvald_sprayer::sprayer_controllerResponse :definition-)
      "string order
uint32 nodeID
---
string message


")



(provide :thorvald_sprayer/sprayer_controller "d219122364590b6594a5c4f91ba561ca")


