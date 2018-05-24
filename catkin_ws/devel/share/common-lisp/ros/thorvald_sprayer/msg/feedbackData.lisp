; Auto-generated. Do not edit!


(cl:in-package thorvald_sprayer-msg)


;//! \htmlinclude feedbackData.msg.html

(cl:defclass <feedbackData> (roslisp-msg-protocol:ros-message)
  ((pressure
    :reader pressure
    :initarg :pressure
    :type cl:integer
    :initform 0))
)

(cl:defclass feedbackData (<feedbackData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <feedbackData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'feedbackData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-msg:<feedbackData> is deprecated: use thorvald_sprayer-msg:feedbackData instead.")))

(cl:ensure-generic-function 'pressure-val :lambda-list '(m))
(cl:defmethod pressure-val ((m <feedbackData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-msg:pressure-val is deprecated.  Use thorvald_sprayer-msg:pressure instead.")
  (pressure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <feedbackData>) ostream)
  "Serializes a message object of type '<feedbackData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pressure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pressure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pressure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pressure)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <feedbackData>) istream)
  "Deserializes a message object of type '<feedbackData>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pressure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pressure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pressure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pressure)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<feedbackData>)))
  "Returns string type for a message object of type '<feedbackData>"
  "thorvald_sprayer/feedbackData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'feedbackData)))
  "Returns string type for a message object of type 'feedbackData"
  "thorvald_sprayer/feedbackData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<feedbackData>)))
  "Returns md5sum for a message object of type '<feedbackData>"
  "1169f7bffca25caef495c23afe53b2b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedbackData)))
  "Returns md5sum for a message object of type 'feedbackData"
  "1169f7bffca25caef495c23afe53b2b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedbackData>)))
  "Returns full string definition for message of type '<feedbackData>"
  (cl:format cl:nil "uint32 pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedbackData)))
  "Returns full string definition for message of type 'feedbackData"
  (cl:format cl:nil "uint32 pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <feedbackData>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <feedbackData>))
  "Converts a ROS message object to a list"
  (cl:list 'feedbackData
    (cl:cons ':pressure (pressure msg))
))
