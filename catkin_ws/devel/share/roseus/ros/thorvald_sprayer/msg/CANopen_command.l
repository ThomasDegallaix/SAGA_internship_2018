;; Auto-generated. Do not edit!


(when (boundp 'thorvald_sprayer::CANopen_command)
  (if (not (find-package "THORVALD_SPRAYER"))
    (make-package "THORVALD_SPRAYER"))
  (shadow 'CANopen_command (find-package "THORVALD_SPRAYER")))
(unless (find-package "THORVALD_SPRAYER::CANOPEN_COMMAND")
  (make-package "THORVALD_SPRAYER::CANOPEN_COMMAND"))

(in-package "ROS")
;;//! \htmlinclude CANopen_command.msg.html


(defclass thorvald_sprayer::CANopen_command
  :super ros::object
  :slots (_can_id _length _data ))

(defmethod thorvald_sprayer::CANopen_command
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
    ;; uint32 _can_id
    4
    ;; uint32 _length
    4
    ;; uint16[2] _data
    (* 2    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _can_id
       (write-long _can_id s)
     ;; uint32 _length
       (write-long _length s)
     ;; uint16[2] _data
     (dotimes (i 2)
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _can_id
     (setq _can_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _length
     (setq _length (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16[2] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get thorvald_sprayer::CANopen_command :md5sum-) "783e92fd87c6fc584db98dd64fdf6b63")
(setf (get thorvald_sprayer::CANopen_command :datatype-) "thorvald_sprayer/CANopen_command")
(setf (get thorvald_sprayer::CANopen_command :definition-)
      "uint32 can_id
uint32 length
uint16[2] data

")



(provide :thorvald_sprayer/CANopen_command "783e92fd87c6fc584db98dd64fdf6b63")


