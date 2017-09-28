; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude ReadServos.msg.html

(cl:defclass <ReadServos> (roslisp-msg-protocol:ros-message)
  ((posizione
    :reader posizione
    :initarg :posizione
    :type f1_rossonet-msg:Servos
    :initform (cl:make-instance 'f1_rossonet-msg:Servos)))
)

(cl:defclass ReadServos (<ReadServos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadServos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadServos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<ReadServos> is deprecated: use f1_rossonet-msg:ReadServos instead.")))

(cl:ensure-generic-function 'posizione-val :lambda-list '(m))
(cl:defmethod posizione-val ((m <ReadServos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:posizione-val is deprecated.  Use f1_rossonet-msg:posizione instead.")
  (posizione m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadServos>) ostream)
  "Serializes a message object of type '<ReadServos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posizione) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadServos>) istream)
  "Deserializes a message object of type '<ReadServos>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posizione) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadServos>)))
  "Returns string type for a message object of type '<ReadServos>"
  "f1_rossonet/ReadServos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadServos)))
  "Returns string type for a message object of type 'ReadServos"
  "f1_rossonet/ReadServos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadServos>)))
  "Returns md5sum for a message object of type '<ReadServos>"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadServos)))
  "Returns md5sum for a message object of type 'ReadServos"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadServos>)))
  "Returns full string definition for message of type '<ReadServos>"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadServos)))
  "Returns full string definition for message of type 'ReadServos"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadServos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posizione))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadServos>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadServos
    (cl:cons ':posizione (posizione msg))
))
