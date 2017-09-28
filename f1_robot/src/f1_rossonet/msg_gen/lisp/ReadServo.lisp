; Auto-generated. Do not edit!


(cl:in-package f1_rossonet-msg)


;//! \htmlinclude ReadServo.msg.html

(cl:defclass <ReadServo> (roslisp-msg-protocol:ros-message)
  ((posizione
    :reader posizione
    :initarg :posizione
    :type f1_rossonet-msg:Servos
    :initform (cl:make-instance 'f1_rossonet-msg:Servos)))
)

(cl:defclass ReadServo (<ReadServo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadServo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadServo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f1_rossonet-msg:<ReadServo> is deprecated: use f1_rossonet-msg:ReadServo instead.")))

(cl:ensure-generic-function 'posizione-val :lambda-list '(m))
(cl:defmethod posizione-val ((m <ReadServo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f1_rossonet-msg:posizione-val is deprecated.  Use f1_rossonet-msg:posizione instead.")
  (posizione m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadServo>) ostream)
  "Serializes a message object of type '<ReadServo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posizione) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadServo>) istream)
  "Deserializes a message object of type '<ReadServo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posizione) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadServo>)))
  "Returns string type for a message object of type '<ReadServo>"
  "f1_rossonet/ReadServo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadServo)))
  "Returns string type for a message object of type 'ReadServo"
  "f1_rossonet/ReadServo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadServo>)))
  "Returns md5sum for a message object of type '<ReadServo>"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadServo)))
  "Returns md5sum for a message object of type 'ReadServo"
  "38c35486bc1889288de434181d43c782")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadServo>)))
  "Returns full string definition for message of type '<ReadServo>"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadServo)))
  "Returns full string definition for message of type 'ReadServo"
  (cl:format cl:nil "Servos posizione~%~%================================================================================~%MSG: f1_rossonet/Servos~%int16 link1~%int16 link2~%int16 link3~%int16 link4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadServo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posizione))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadServo>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadServo
    (cl:cons ':posizione (posizione msg))
))
