; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude F1Servos.msg.html

(cl:defclass <F1Servos> (roslisp-msg-protocol:ros-message)
  ((link1
    :reader link1
    :initarg :link1
    :type cl:fixnum
    :initform 0)
   (link2
    :reader link2
    :initarg :link2
    :type cl:fixnum
    :initform 0)
   (link3
    :reader link3
    :initarg :link3
    :type cl:fixnum
    :initform 0)
   (link4
    :reader link4
    :initarg :link4
    :type cl:fixnum
    :initform 0))
)

(cl:defclass F1Servos (<F1Servos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <F1Servos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'F1Servos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<F1Servos> is deprecated: use f1_rossonet-msg:F1Servos instead.")))

(cl:ensure-generic-function 'link1-val :lambda-list '(m))
(cl:defmethod link1-val ((m <F1Servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:link1-val is deprecated.  Use f1_rossonet-msg:link1 instead.")
  (link1 m))

(cl:ensure-generic-function 'link2-val :lambda-list '(m))
(cl:defmethod link2-val ((m <F1Servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:link2-val is deprecated.  Use f1_rossonet-msg:link2 instead.")
  (link2 m))

(cl:ensure-generic-function 'link3-val :lambda-list '(m))
(cl:defmethod link3-val ((m <F1Servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:link3-val is deprecated.  Use f1_rossonet-msg:link3 instead.")
  (link3 m))

(cl:ensure-generic-function 'link4-val :lambda-list '(m))
(cl:defmethod link4-val ((m <F1Servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:link4-val is deprecated.  Use f1_rossonet-msg:link4 instead.")
  (link4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <F1Servos>) ostream)
  "Serializes a message object of type '<F1Servos>"
  (cl:let* ((signed (cl:slot-value msg 'link1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'link2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'link3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'link4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <F1Servos>) istream)
  "Deserializes a message object of type '<F1Servos>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'link1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'link2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'link3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'link4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<F1Servos>)))
  "Returns string type for a message object of type '<F1Servos>"
  "f1_rossonet/F1Servos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'F1Servos)))
  "Returns string type for a message object of type 'F1Servos"
  "f1_rossonet/F1Servos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<F1Servos>)))
  "Returns md5sum for a message object of type '<F1Servos>"
  "dc0febb9f174e8d6241b1ffaeae071be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'F1Servos)))
  "Returns md5sum for a message object of type 'F1Servos"
  "dc0febb9f174e8d6241b1ffaeae071be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<F1Servos>)))
  "Returns full string definition for message of type '<F1Servos>"
  (cl:format cl:nil "int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'F1Servos)))
  "Returns full string definition for message of type 'F1Servos"
  (cl:format cl:nil "int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <F1Servos>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <F1Servos>))
  "Converts a ROS message object to a list"
  (cl:list 'F1Servos
    (cl:cons ':link1 (link1 msg))
    (cl:cons ':link2 (link2 msg))
    (cl:cons ':link3 (link3 msg))
    (cl:cons ':link4 (link4 msg))
))
