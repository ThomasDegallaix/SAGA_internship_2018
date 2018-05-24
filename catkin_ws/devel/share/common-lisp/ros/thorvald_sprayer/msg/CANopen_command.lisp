; Auto-generated. Do not edit!


(cl:in-package thorvald_sprayer-msg)


;//! \htmlinclude CANopen_command.msg.html

(cl:defclass <CANopen_command> (roslisp-msg-protocol:ros-message)
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

(cl:defclass CANopen_command (<CANopen_command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CANopen_command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CANopen_command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thorvald_sprayer-msg:<CANopen_command> is deprecated: use thorvald_sprayer-msg:CANopen_command instead.")))

(cl:ensure-generic-function 'can_id-val :lambda-list '(m))
(cl:defmethod can_id-val ((m <CANopen_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-msg:can_id-val is deprecated.  Use thorvald_sprayer-msg:can_id instead.")
  (can_id m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <CANopen_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-msg:length-val is deprecated.  Use thorvald_sprayer-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CANopen_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thorvald_sprayer-msg:data-val is deprecated.  Use thorvald_sprayer-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CANopen_command>) ostream)
  "Serializes a message object of type '<CANopen_command>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'can_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'can_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'can_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'can_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CANopen_command>) istream)
  "Deserializes a message object of type '<CANopen_command>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'can_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'can_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'can_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'can_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CANopen_command>)))
  "Returns string type for a message object of type '<CANopen_command>"
  "thorvald_sprayer/CANopen_command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CANopen_command)))
  "Returns string type for a message object of type 'CANopen_command"
  "thorvald_sprayer/CANopen_command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CANopen_command>)))
  "Returns md5sum for a message object of type '<CANopen_command>"
  "783e92fd87c6fc584db98dd64fdf6b63")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CANopen_command)))
  "Returns md5sum for a message object of type 'CANopen_command"
  "783e92fd87c6fc584db98dd64fdf6b63")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CANopen_command>)))
  "Returns full string definition for message of type '<CANopen_command>"
  (cl:format cl:nil "uint32 can_id~%uint32 length~%uint16[2] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CANopen_command)))
  "Returns full string definition for message of type 'CANopen_command"
  (cl:format cl:nil "uint32 can_id~%uint32 length~%uint16[2] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CANopen_command>))
  (cl:+ 0
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CANopen_command>))
  "Converts a ROS message object to a list"
  (cl:list 'CANopen_command
    (cl:cons ':can_id (can_id msg))
    (cl:cons ':length (length msg))
    (cl:cons ':data (data msg))
))
