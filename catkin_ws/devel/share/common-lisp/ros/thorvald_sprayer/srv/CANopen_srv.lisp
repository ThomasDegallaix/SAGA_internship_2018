; Auto-generated. Do not edit!


(cl:in-package thorvald_sprayer-srv)


;//! \htmlinclude CANopen_srv-request.msg.html

(cl:defclass <CANopen_srv-request> (roslisp-msg-protocol:ros-message)
  ((can_id
    :reader can_id
    :initarg :can_id
    :type cl:integer
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass CANopen_srv-request (<CANopen_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CANopen_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CANopen_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-srv:<CANopen_srv-request> is deprecated: use thorvald_sprayer-srv:CANopen_srv-request instead.")))

(cl:ensure-generic-function 'can_id-val :lambda-list '(m))
(cl:defmethod can_id-val ((m <CANopen_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:can_id-val is deprecated.  Use thorvald_sprayer-srv:can_id instead.")
  (can_id m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <CANopen_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:length-val is deprecated.  Use thorvald_sprayer-srv:length instead.")
  (length m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CANopen_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:data-val is deprecated.  Use thorvald_sprayer-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CANopen_srv-request>) ostream)
  "Serializes a message object of type '<CANopen_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'can_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CANopen_srv-request>) istream)
  "Deserializes a message object of type '<CANopen_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'can_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'length) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CANopen_srv-request>)))
  "Returns string type for a service object of type '<CANopen_srv-request>"
  "thorvald_sprayer/CANopen_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CANopen_srv-request)))
  "Returns string type for a service object of type 'CANopen_srv-request"
  "thorvald_sprayer/CANopen_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CANopen_srv-request>)))
  "Returns md5sum for a message object of type '<CANopen_srv-request>"
  "f8d20e0fc83f153976971528075db05b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CANopen_srv-request)))
  "Returns md5sum for a message object of type 'CANopen_srv-request"
  "f8d20e0fc83f153976971528075db05b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CANopen_srv-request>)))
  "Returns full string definition for message of type '<CANopen_srv-request>"
  (cl:format cl:nil "int32 can_id~%int32 length~%uint16[2] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CANopen_srv-request)))
  "Returns full string definition for message of type 'CANopen_srv-request"
  (cl:format cl:nil "int32 can_id~%int32 length~%uint16[2] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CANopen_srv-request>))
  (cl:+ 0
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CANopen_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CANopen_srv-request
    (cl:cons ':can_id (can_id msg))
    (cl:cons ':length (length msg))
    (cl:cons ':data (data msg))
))
;//! \htmlinclude CANopen_srv-response.msg.html

(cl:defclass <CANopen_srv-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CANopen_srv-response (<CANopen_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CANopen_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CANopen_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-srv:<CANopen_srv-response> is deprecated: use thorvald_sprayer-srv:CANopen_srv-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <CANopen_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:message-val is deprecated.  Use thorvald_sprayer-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <CANopen_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-srv:success-val is deprecated.  Use thorvald_sprayer-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CANopen_srv-response>) ostream)
  "Serializes a message object of type '<CANopen_srv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CANopen_srv-response>) istream)
  "Deserializes a message object of type '<CANopen_srv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CANopen_srv-response>)))
  "Returns string type for a service object of type '<CANopen_srv-response>"
  "thorvald_sprayer/CANopen_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CANopen_srv-response)))
  "Returns string type for a service object of type 'CANopen_srv-response"
  "thorvald_sprayer/CANopen_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CANopen_srv-response>)))
  "Returns md5sum for a message object of type '<CANopen_srv-response>"
  "f8d20e0fc83f153976971528075db05b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CANopen_srv-response)))
  "Returns md5sum for a message object of type 'CANopen_srv-response"
  "f8d20e0fc83f153976971528075db05b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CANopen_srv-response>)))
  "Returns full string definition for message of type '<CANopen_srv-response>"
  (cl:format cl:nil "string message~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CANopen_srv-response)))
  "Returns full string definition for message of type 'CANopen_srv-response"
  (cl:format cl:nil "string message~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CANopen_srv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CANopen_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CANopen_srv-response
    (cl:cons ':message (message msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CANopen_srv)))
  'CANopen_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CANopen_srv)))
  'CANopen_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CANopen_srv)))
  "Returns string type for a service object of type '<CANopen_srv>"
  "thorvald_sprayer/CANopen_srv")