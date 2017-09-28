/* Auto-generated by genmsg_cpp for file /home/rossonet/catkin_ws/src/f1_rossonet/msg/Servos.msg */
#ifndef F1_ROSSONET_MESSAGE_SERVOS_H
#define F1_ROSSONET_MESSAGE_SERVOS_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"


namespace f1_rossonet
{
template <class ContainerAllocator>
struct Servos_ {
  typedef Servos_<ContainerAllocator> Type;

  Servos_()
  : link1(0)
  , link2(0)
  , link3(0)
  , link4(0)
  {
  }

  Servos_(const ContainerAllocator& _alloc)
  : link1(0)
  , link2(0)
  , link3(0)
  , link4(0)
  {
  }

  typedef int16_t _link1_type;
  int16_t link1;

  typedef int16_t _link2_type;
  int16_t link2;

  typedef int16_t _link3_type;
  int16_t link3;

  typedef int16_t _link4_type;
  int16_t link4;


  typedef boost::shared_ptr< ::f1_rossonet::Servos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::f1_rossonet::Servos_<ContainerAllocator>  const> ConstPtr;
}; // struct Servos
typedef  ::f1_rossonet::Servos_<std::allocator<void> > Servos;

typedef boost::shared_ptr< ::f1_rossonet::Servos> ServosPtr;
typedef boost::shared_ptr< ::f1_rossonet::Servos const> ServosConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::f1_rossonet::Servos_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::f1_rossonet::Servos_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace f1_rossonet

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::f1_rossonet::Servos_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::f1_rossonet::Servos_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::f1_rossonet::Servos_<ContainerAllocator> > {
  static const char* value() 
  {
    return "dc0febb9f174e8d6241b1ffaeae071be";
  }

  static const char* value(const  ::f1_rossonet::Servos_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xdc0febb9f174e8d6ULL;
  static const uint64_t static_value2 = 0x241b1ffaeae071beULL;
};

template<class ContainerAllocator>
struct DataType< ::f1_rossonet::Servos_<ContainerAllocator> > {
  static const char* value() 
  {
    return "f1_rossonet/Servos";
  }

  static const char* value(const  ::f1_rossonet::Servos_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::f1_rossonet::Servos_<ContainerAllocator> > {
  static const char* value() 
  {
    return "int16 link1\n\
int16 link2\n\
int16 link3\n\
int16 link4\n\
\n\
";
  }

  static const char* value(const  ::f1_rossonet::Servos_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::f1_rossonet::Servos_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::f1_rossonet::Servos_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.link1);
    stream.next(m.link2);
    stream.next(m.link3);
    stream.next(m.link4);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct Servos_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::f1_rossonet::Servos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::f1_rossonet::Servos_<ContainerAllocator> & v) 
  {
    s << indent << "link1: ";
    Printer<int16_t>::stream(s, indent + "  ", v.link1);
    s << indent << "link2: ";
    Printer<int16_t>::stream(s, indent + "  ", v.link2);
    s << indent << "link3: ";
    Printer<int16_t>::stream(s, indent + "  ", v.link3);
    s << indent << "link4: ";
    Printer<int16_t>::stream(s, indent + "  ", v.link4);
  }
};


} // namespace message_operations
} // namespace ros

#endif // F1_ROSSONET_MESSAGE_SERVOS_H

