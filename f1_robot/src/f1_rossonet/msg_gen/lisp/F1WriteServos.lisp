; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude F1WriteServos.msg.html

(cl:defclass <F1WriteServos> (roslisp-msg-protocol:ros-message)
  ((posizione
    :reader posizione
    :initarg :posizione
    :type f1_rossonet-msg:F1Servos
    :initform (cl:make-instance 'f1_rossonet-msg:F1Servos)))
)

(cl:defclass F1WriteServos (<F1WriteServos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <F1WriteServos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'F1WriteServos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<F1WriteServos> is deprecated: use f1_rossonet-msg:F1WriteServos instead.")))

(cl:ensure-generic-function 'posizione-val :lambda-list '(m))
(cl:defmethod posizione-val ((m <F1WriteServos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:posizione-val is deprecated.  Use f1_rossonet-msg:posizione instead.")
  (posizione m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <F1WriteServos>) ostream)
  "Serializes a message object of type '<F1WriteServos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posizione) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <F1WriteServos>) istream)
  "Deserializes a message object of type '<F1WriteServos>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posizione) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<F1WriteServos>)))
  "Returns string type for a message object of type '<F1WriteServos>"
  "f1_rossonet/F1WriteServos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'F1WriteServos)))
  "Returns string type for a message object of type 'F1WriteServos"
  "f1_rossonet/F1WriteServos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<F1WriteServos>)))
  "Returns md5sum for a message object of type '<F1WriteServos>"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'F1WriteServos)))
  "Returns md5sum for a message object of type 'F1WriteServos"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<F1WriteServos>)))
  "Returns full string definition for message of type '<F1WriteServos>"
  (cl:format cl:nil "F1Servos posizione~%~%================================================================================~%MSG: f1_rossonet/F1Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'F1WriteServos)))
  "Returns full string definition for message of type 'F1WriteServos"
  (cl:format cl:nil "F1Servos posizione~%~%================================================================================~%MSG: f1_rossonet/F1Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <F1WriteServos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posizione))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <F1WriteServos>))
  "Converts a ROS message object to a list"
  (cl:list 'F1WriteServos
    (cl:cons ':posizione (posizione msg))
))
