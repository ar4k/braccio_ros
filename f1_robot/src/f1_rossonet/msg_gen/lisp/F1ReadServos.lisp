; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude F1ReadServos.msg.html

(cl:defclass <F1ReadServos> (roslisp-msg-protocol:ros-message)
  ((posizione
    :reader posizione
    :initarg :posizione
    :type f1_rossonet-msg:F1Servos
    :initform (cl:make-instance 'f1_rossonet-msg:F1Servos)))
)

(cl:defclass F1ReadServos (<F1ReadServos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <F1ReadServos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'F1ReadServos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<F1ReadServos> is deprecated: use f1_rossonet-msg:F1ReadServos instead.")))

(cl:ensure-generic-function 'posizione-val :lambda-list '(m))
(cl:defmethod posizione-val ((m <F1ReadServos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:posizione-val is deprecated.  Use f1_rossonet-msg:posizione instead.")
  (posizione m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <F1ReadServos>) ostream)
  "Serializes a message object of type '<F1ReadServos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posizione) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <F1ReadServos>) istream)
  "Deserializes a message object of type '<F1ReadServos>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posizione) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<F1ReadServos>)))
  "Returns string type for a message object of type '<F1ReadServos>"
  "f1_rossonet/F1ReadServos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'F1ReadServos)))
  "Returns string type for a message object of type 'F1ReadServos"
  "f1_rossonet/F1ReadServos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<F1ReadServos>)))
  "Returns md5sum for a message object of type '<F1ReadServos>"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'F1ReadServos)))
  "Returns md5sum for a message object of type 'F1ReadServos"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<F1ReadServos>)))
  "Returns full string definition for message of type '<F1ReadServos>"
  (cl:format cl:nil "F1Servos posizione~%~%================================================================================~%MSG: f1_rossonet/F1Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'F1ReadServos)))
  "Returns full string definition for message of type 'F1ReadServos"
  (cl:format cl:nil "F1Servos posizione~%~%================================================================================~%MSG: f1_rossonet/F1Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <F1ReadServos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posizione))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <F1ReadServos>))
  "Converts a ROS message object to a list"
  (cl:list 'F1ReadServos
    (cl:cons ':posizione (posizione msg))
))
