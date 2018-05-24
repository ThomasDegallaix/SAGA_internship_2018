;; Auto-generated. Do not edit!


(when (boundp 'thorvald_sprayer::CANFrame)
  (if (not (find-package "THORVALD_SPRAYER"))
    (make-package "THORVALD_SPRAYER"))
  (shadow 'CANFrame (find-package "THORVALD_SPRAYER")))
(unless (find-package "THORVALD_SPRAYER::CANFRAME")
  (make-package "THORVALD_SPRAYER::CANFRAME"))

(in-package "ROS")
;;//! \htmlinclude CANFrame.msg.html


(defclass thorvald_sprayer::CANFrame
  :super ros::object
  :slots (_can_id _length _data ))

(defmethod thorvald_sprayer::CANFrame
  (:init
   (&key
    ((:can_id __can_id) 0)
    ((:length __length) 0)
    ((:data __data) (make-array 8 :initial-element 0 :element-type :char))
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
    ;; uint8 _length
    1
    ;; uint8[8] _data
    (* 1    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _can_id
       (write-long _can_id s)
     ;; uint8 _length
       (write-byte _length s)
     ;; uint8[8] _data
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _can_id
     (setq _can_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _length
     (setq _length (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[8] _data
   (setq _data (make-array 8 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 8)
   ;;
   self)
  )

(setf (get thorvald_sprayer::CANFrame :md5sum-) "db6f3cdc168faf58b50386b02cdccc8f")
(setf (get thorvald_sprayer::CANFrame :datatype-) "thorvald_sprayer/CANFrame")
(setf (get thorvald_sprayer::CANFrame :definition-)
      "uint32 can_id
uint8 length
uint8[8] data

")



(provide :thorvald_sprayer/CANFrame "db6f3cdc168faf58b50386b02cdccc8f")


