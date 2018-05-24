;; Auto-generated. Do not edit!


(when (boundp 'thorvald_sprayer::CANopen_srv)
  (if (not (find-package "THORVALD_SPRAYER"))
    (make-package "THORVALD_SPRAYER"))
  (shadow 'CANopen_srv (find-package "THORVALD_SPRAYER")))
(unless (find-package "THORVALD_SPRAYER::CANOPEN_SRV")
  (make-package "THORVALD_SPRAYER::CANOPEN_SRV"))
(unless (find-package "THORVALD_SPRAYER::CANOPEN_SRVREQUEST")
  (make-package "THORVALD_SPRAYER::CANOPEN_SRVREQUEST"))
(unless (find-package "THORVALD_SPRAYER::CANOPEN_SRVRESPONSE")
  (make-package "THORVALD_SPRAYER::CANOPEN_SRVRESPONSE"))

(in-package "ROS")





(defclass thorvald_sprayer::CANopen_srvRequest
  :super ros::object
  :slots (_can_id _length _data ))

(defmethod thorvald_sprayer::CANopen_srvRequest
  (:init
   (&key
    ((:can_id __can_id) 0)
    ((:length __length) 0)
    ((:data __data) (make-array 2 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _can_id (round __can_id))
   (setq _length (round __length))
   (setq _data __data)
   self)
  (:can_id
   (&optional __can_id)
   (if __can_id (setq _can_id __can_id)) _can_id)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _can_id
    4
    ;; int32 _length
    4
    ;; uint16[2] _data
    (* 2    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _can_id
       (write-long _can_id s)
     ;; int32 _length
       (write-long _length s)
     ;; uint16[2] _data
     (dotimes (i 2)
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _can_id
     (setq _can_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _length
     (setq _length (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16[2] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(defclass thorvald_sprayer::CANopen_srvResponse
  :super ros::object
  :slots (_message _success ))

(defmethod thorvald_sprayer::CANopen_srvResponse
  (:init
   (&key
    ((:message __message) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _message (string __message))
   (setq _success __success)
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass thorvald_sprayer::CANopen_srv
  :super ros::object
  :slots ())

(setf (get thorvald_sprayer::CANopen_srv :md5sum-) "f8d20e0fc83f153976971528075db05b")
(setf (get thorvald_sprayer::CANopen_srv :datatype-) "thorvald_sprayer/CANopen_srv")
(setf (get thorvald_sprayer::CANopen_srv :request) thorvald_sprayer::CANopen_srvRequest)
(setf (get thorvald_sprayer::CANopen_srv :response) thorvald_sprayer::CANopen_srvResponse)

(defmethod thorvald_sprayer::CANopen_srvRequest
  (:response () (instance thorvald_sprayer::CANopen_srvResponse :init)))

(setf (get thorvald_sprayer::CANopen_srvRequest :md5sum-) "f8d20e0fc83f153976971528075db05b")
(setf (get thorvald_sprayer::CANopen_srvRequest :datatype-) "thorvald_sprayer/CANopen_srvRequest")
(setf (get thorvald_sprayer::CANopen_srvRequest :definition-)
      "int32 can_id
int32 length
uint16[2] data
---
string message
bool success

")

(setf (get thorvald_sprayer::CANopen_srvResponse :md5sum-) "f8d20e0fc83f153976971528075db05b")
(setf (get thorvald_sprayer::CANopen_srvResponse :datatype-) "thorvald_sprayer/CANopen_srvResponse")
(setf (get thorvald_sprayer::CANopen_srvResponse :definition-)
      "int32 can_id
int32 length
uint16[2] data
---
string message
bool success

")



(provide :thorvald_sprayer/CANopen_srv "f8d20e0fc83f153976971528075db05b")


