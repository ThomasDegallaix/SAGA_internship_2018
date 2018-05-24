;; Auto-generated. Do not edit!


(when (boundp 'thorvald_sprayer::feedbackData)
  (if (not (find-package "THORVALD_SPRAYER"))
    (make-package "THORVALD_SPRAYER"))
  (shadow 'feedbackData (find-package "THORVALD_SPRAYER")))
(unless (find-package "THORVALD_SPRAYER::FEEDBACKDATA")
  (make-package "THORVALD_SPRAYER::FEEDBACKDATA"))

(in-package "ROS")
;;//! \htmlinclude feedbackData.msg.html


(defclass thorvald_sprayer::feedbackData
  :super ros::object
  :slots (_pressure ))

(defmethod thorvald_sprayer::feedbackData
  (:init
   (&key
    ((:pressure __pressure) 0)
    )
   (send-super :init)
   (setq _pressure (round __pressure))
   self)
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:serialization-length
   ()
   (+
    ;; uint32 _pressure
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _pressure
       (write-long _pressure s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _pressure
     (setq _pressure (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get thorvald_sprayer::feedbackData :md5sum-) "1169f7bffca25caef495c23afe53b2b8")
(setf (get thorvald_sprayer::feedbackData :datatype-) "thorvald_sprayer/feedbackData")
(setf (get thorvald_sprayer::feedbackData :definition-)
      "uint32 pressure

")



(provide :thorvald_sprayer/feedbackData "1169f7bffca25caef495c23afe53b2b8")


