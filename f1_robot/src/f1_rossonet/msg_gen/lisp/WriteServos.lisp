; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude WriteServos.msg.html

(cl:defclass <WriteServos> (roslisp-msg-protocol:ros-message)
  ((posizione
    :reader posizione
    :initarg :posizione
    :type f1_rossonet-msg:Servos
    :initform (cl:make-instance 'f1_rossonet-msg:Servos)))
)

(cl:defclass WriteServos (<WriteServos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WriteServos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WriteServos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<WriteServos> is deprecated: use f1_rossonet-msg:WriteServos instead.")))

(cl:ensure-generic-function 'posizione-val :lambda-list '(m))
(cl:defmethod posizione-val ((m <WriteServos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:posizione-val is deprecated.  Use f1_rossonet-msg:posizione instead.")
  (posizione m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WriteServos>) ostream)
  "Serializes a message object of type '<WriteServos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posizione) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WriteServos>) istream)
  "Deserializes a message object of type '<WriteServos>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posizione) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WriteServos>)))
  "Returns string type for a message object of type '<WriteServos>"
  "f1_rossonet/WriteServos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WriteServos)))
  "Returns string type for a message object of type 'WriteServos"
  "f1_rossonet/WriteServos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WriteServos>)))
  "Returns md5sum for a message object of type '<WriteServos>"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WriteServos)))
  "Returns md5sum for a message object of type 'WriteServos"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WriteServos>)))
  "Returns full string definition for message of type '<WriteServos>"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WriteServos)))
  "Returns full string definition for message of type 'WriteServos"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WriteServos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posizione))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WriteServos>))
  "Converts a ROS message object to a list"
  (cl:list 'WriteServos
    (cl:cons ':posizione (posizione msg))
))
