// Generated by gencpp from file ublox_msgs/CfgRATE.msg
// DO NOT EDIT!


#ifndef UBLOX_MSGS_MESSAGE_CFGRATE_H
#define UBLOX_MSGS_MESSAGE_CFGRATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ublox_msgs
{
template <class ContainerAllocator>
struct CfgRATE_
{
  typedef CfgRATE_<ContainerAllocator> Type;

  CfgRATE_()
    : measRate(0)
    , navRate(0)
    , timeRef(0)  {
    }
  CfgRATE_(const ContainerAllocator& _alloc)
    : measRate(0)
    , navRate(0)
    , timeRef(0)  {
  (void)_alloc;
    }



   typedef uint16_t _measRate_type;
  _measRate_type measRate;

   typedef uint16_t _navRate_type;
  _navRate_type navRate;

   typedef uint16_t _timeRef_type;
  _timeRef_type timeRef;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(CLASS_ID)
  #undef CLASS_ID
#endif
#if defined(_WIN32) && defined(MESSAGE_ID)
  #undef MESSAGE_ID
#endif
#if defined(_WIN32) && defined(TIME_REF_UTC)
  #undef TIME_REF_UTC
#endif
#if defined(_WIN32) && defined(TIME_REF_GPS)
  #undef TIME_REF_GPS
#endif
#if defined(_WIN32) && defined(TIME_REF_GLONASS)
  #undef TIME_REF_GLONASS
#endif
#if defined(_WIN32) && defined(TIME_REF_BEIDOU)
  #undef TIME_REF_BEIDOU
#endif
#if defined(_WIN32) && defined(TIME_REF_GALILEO)
  #undef TIME_REF_GALILEO
#endif

  enum {
    CLASS_ID = 6u,
    MESSAGE_ID = 8u,
    TIME_REF_UTC = 0u,
    TIME_REF_GPS = 1u,
    TIME_REF_GLONASS = 2u,
    TIME_REF_BEIDOU = 3u,
    TIME_REF_GALILEO = 4u,
  };


  typedef boost::shared_ptr< ::ublox_msgs::CfgRATE_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ublox_msgs::CfgRATE_<ContainerAllocator> const> ConstPtr;

}; // struct CfgRATE_

typedef ::ublox_msgs::CfgRATE_<std::allocator<void> > CfgRATE;

typedef boost::shared_ptr< ::ublox_msgs::CfgRATE > CfgRATEPtr;
typedef boost::shared_ptr< ::ublox_msgs::CfgRATE const> CfgRATEConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ublox_msgs::CfgRATE_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ublox_msgs::CfgRATE_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ublox_msgs::CfgRATE_<ContainerAllocator1> & lhs, const ::ublox_msgs::CfgRATE_<ContainerAllocator2> & rhs)
{
  return lhs.measRate == rhs.measRate &&
    lhs.navRate == rhs.navRate &&
    lhs.timeRef == rhs.timeRef;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ublox_msgs::CfgRATE_<ContainerAllocator1> & lhs, const ::ublox_msgs::CfgRATE_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ublox_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::CfgRATE_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::CfgRATE_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::CfgRATE_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
{
  static const char* value()
  {
    return "13e27469d3f7d85353464015f687d6b2";
  }

  static const char* value(const ::ublox_msgs::CfgRATE_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x13e27469d3f7d853ULL;
  static const uint64_t static_value2 = 0x53464015f687d6b2ULL;
};

template<class ContainerAllocator>
struct DataType< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ublox_msgs/CfgRATE";
  }

  static const char* value(const ::ublox_msgs::CfgRATE_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# CFG-RATE (0x06 0x08)\n"
"# Navigation/Measurement Rate Settings\n"
"#\n"
"# This message allows the user to alter the rate at which navigation solutions \n"
"# (and the measurements that they depend on) are generated by the receiver. The \n"
"# calculation of the navigation solution will always be aligned to the top of a \n"
"# second zero (first second of the week) of the configured reference time \n"
"# system. For protocol version 18 and later the navigation period is an integer \n"
"# multiple of the measurement period.\n"
"#  - Each measurement triggers the measurements generation and raw data output.\n"
"#  - The navRate value defines that every nth measurement triggers a navigation \n"
"#    epoch.\n"
"#  - The update rate has a direct influence on the power consumption. The more \n"
"#    fixes that are required, the more CPU power and communication resources \n"
"#    are required.\n"
"#  - For most applications a 1 Hz update rate would be sufficient.\n"
"#  - When using Power Save Mode, measurement and navigation rate can differ from\n"
"#    the values configured here\n"
"\n"
"uint8 CLASS_ID = 6\n"
"uint8 MESSAGE_ID = 8\n"
"\n"
"uint16 measRate           # Measurement Rate, GPS measurements are\n"
"                          # taken every measRate milliseconds [ms]\n"
"uint16 navRate            # Navigation Rate, in number of measurement\n"
"                          # cycles. On u-blox 5 and u-blox 6, this parameter\n"
"                          # cannot be changed, and always equals 1.\n"
"uint16 timeRef            # The time system to which measurements are aligned\n"
"uint16 TIME_REF_UTC = 0\n"
"uint16 TIME_REF_GPS = 1\n"
"uint16 TIME_REF_GLONASS = 2   # not supported in protocol versions less than 18\n"
"uint16 TIME_REF_BEIDOU = 3    # not supported in protocol versions less than 18\n"
"uint16 TIME_REF_GALILEO = 4   # not supported in protocol versions less than 18\n"
;
  }

  static const char* value(const ::ublox_msgs::CfgRATE_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.measRate);
      stream.next(m.navRate);
      stream.next(m.timeRef);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CfgRATE_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ublox_msgs::CfgRATE_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ublox_msgs::CfgRATE_<ContainerAllocator>& v)
  {
    s << indent << "measRate: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.measRate);
    s << indent << "navRate: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.navRate);
    s << indent << "timeRef: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.timeRef);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UBLOX_MSGS_MESSAGE_CFGRATE_H
