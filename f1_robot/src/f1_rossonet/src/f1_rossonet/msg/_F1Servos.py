"""autogenerated by genpy from f1_rossonet/F1Servos.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class F1Servos(genpy.Message):
  _md5sum = "dc0febb9f174e8d6241b1ffaeae071be"
  _type = "f1_rossonet/F1Servos"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int16 link1
int16 link2
int16 link3
int16 link4

"""
  __slots__ = ['link1','link2','link3','link4']
  _slot_types = ['int16','int16','int16','int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       link1,link2,link3,link4

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(F1Servos, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.link1 is None:
        self.link1 = 0
      if self.link2 is None:
        self.link2 = 0
      if self.link3 is None:
        self.link3 = 0
      if self.link4 is None:
        self.link4 = 0
    else:
      self.link1 = 0
      self.link2 = 0
      self.link3 = 0
      self.link4 = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_4h.pack(_x.link1, _x.link2, _x.link3, _x.link4))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.link1, _x.link2, _x.link3, _x.link4,) = _struct_4h.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_4h.pack(_x.link1, _x.link2, _x.link3, _x.link4))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.link1, _x.link2, _x.link3, _x.link4,) = _struct_4h.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_4h = struct.Struct("<4h")