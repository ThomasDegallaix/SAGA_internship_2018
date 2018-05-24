; Auto-generated. Do not edit!


(cl:in-package thorvald_sprayer-srv)


;//! \htmlinclude sprayer_controller-request.msg.html

(cl:defclass <sprayer_controller-request> (roslisp-msg-protocol:ros-message)
  ((order
    :reader order
    :initarg :order
    :type cl:string
    :initform "")
   (nodeID
    :reader nodeID
    :initarg :nodeID
    :type cl:integer
    :initform 0))
)

(cl:defclass sprayer_controller-request (<sprayer_controller-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sprayer_controller-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sprayer_controller-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-srv:<sprayer_controller-request> is deprecated: use thorvald_sprayer-srv:sprayer_controller-request instead.")))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <sprayer_controller-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:order-val is deprecated.  Use thorvald_sprayer-srv:order instead.")
  (order m))

(cl:ensure-generic-function 'nodeID-val :lambda-list '(m))
(cl:defmethod nodeID-val ((m <sprayer_controller-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:nodeID-val is deprecated.  Use thorvald_sprayer-srv:nodeID instead.")
  (nodeID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sprayer_controller-request>) ostream)
  "Serializes a message object of type '<sprayer_controller-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'order))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'order))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nodeID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nodeID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nodeID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nodeID)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sprayer_controller-request>) istream)
  "Deserializes a message object of type '<sprayer_controller-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'order) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'order) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nodeID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nodeID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nodeID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nodeID)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sprayer_controller-request>)))
  "Returns string type for a service object of type '<sprayer_controller-request>"
  "thorvald_sprayer/sprayer_controllerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sprayer_controller-request)))
  "Returns string type for a service object of type 'sprayer_controller-request"
  "thorvald_sprayer/sprayer_controllerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sprayer_controller-request>)))
  "Returns md5sum for a message object of type '<sprayer_controller-request>"
  "d219122364590b6594a5c4f91ba561ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sprayer_controller-request)))
  "Returns md5sum for a message object of type 'sprayer_controller-request"
  "d219122364590b6594a5c4f91ba561ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sprayer_controller-request>)))
  "Returns full string definition for message of type '<sprayer_controller-request>"
  (cl:format cl:nil "string order~%uint32 nodeID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sprayer_controller-request)))
  "Returns full string definition for message of type 'sprayer_controller-request"
  (cl:format cl:nil "string order~%uint32 nodeID~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sprayer_controller-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'order))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sprayer_controller-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sprayer_controller-request
    (cl:cons ':order (order msg))
    (cl:cons ':nodeID (nodeID msg))
))
;//! \htmlinclude sprayer_controller-response.msg.html

(cl:defclass <sprayer_controller-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass sprayer_controller-response (<sprayer_controller-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sprayer_controller-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sprayer_controller-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-srv:<sprayer_controller-response> is deprecated: use thorvald_sprayer-srv:sprayer_controller-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <sprayer_controller-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:message-val is deprecated.  Use thorvald_sprayer-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sprayer_controller-response>) ostream)
  "Serializes a message object of type '<sprayer_controller-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sprayer_controller-response>) istream)
  "Deserializes a message object of type '<sprayer_controller-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sprayer_controller-response>)))
  "Returns string type for a service object of type '<sprayer_controller-response>"
  "thorvald_sprayer/sprayer_controllerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sprayer_controller-response)))
  "Returns string type for a service object of type 'sprayer_controller-response"
  "thorvald_sprayer/sprayer_controllerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sprayer_controller-response>)))
  "Returns md5sum for a message object of type '<sprayer_controller-response>"
  "d219122364590b6594a5c4f91ba561ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sprayer_controller-response)))
  "Returns md5sum for a message object of type 'sprayer_controller-response"
  "d219122364590b6594a5c4f91ba561ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sprayer_controller-response>)))
  "Returns full string definition for message of type '<sprayer_controller-response>"
  (cl:format cl:nil "string message~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sprayer_controller-response)))
  "Returns full string definition for message of type 'sprayer_controller-response"
  (cl:format cl:nil "string message~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sprayer_controller-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sprayer_controller-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sprayer_controller-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sprayer_controller)))
  'sprayer_controller-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sprayer_controller)))
  'sprayer_controller-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sprayer_controller)))
  "Returns string type for a service object of type '<sprayer_controller>"
  "thorvald_sprayer/sprayer_controller")