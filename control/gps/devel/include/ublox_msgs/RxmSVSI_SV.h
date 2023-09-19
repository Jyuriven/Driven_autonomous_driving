// Generated by gencpp from file ublox_msgs/RxmSVSI_SV.msg
// DO NOT EDIT!


#ifndef UBLOX_MSGS_MESSAGE_RXMSVSI_SV_H
#define UBLOX_MSGS_MESSAGE_RXMSVSI_SV_H


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
struct RxmSVSI_SV_
{
  typedef RxmSVSI_SV_<ContainerAllocator> Type;

  RxmSVSI_SV_()
    : svid(0)
    , svFlag(0)
    , azim(0)
    , elev(0)
    , age(0)  {
    }
  RxmSVSI_SV_(const ContainerAllocator& _alloc)
    : svid(0)
    , svFlag(0)
    , azim(0)
    , elev(0)
    , age(0)  {
  (void)_alloc;
    }



   typedef uint8_t _svid_type;
  _svid_type svid;

   typedef uint8_t _svFlag_type;
  _svFlag_type svFlag;

   typedef int16_t _azim_type;
  _azim_type azim;

   typedef int8_t _elev_type;
  _elev_type elev;

   typedef uint8_t _age_type;
  _age_type age;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(FLAG_URA_MASK)
  #undef FLAG_URA_MASK
#endif
#if defined(_WIN32) && defined(FLAG_HEALTHY)
  #undef FLAG_HEALTHY
#endif
#if defined(_WIN32) && defined(FLAG_EPH_VAL)
  #undef FLAG_EPH_VAL
#endif
#if defined(_WIN32) && defined(FLAG_ALM_VAL)
  #undef FLAG_ALM_VAL
#endif
#if defined(_WIN32) && defined(FLAG_NOT_AVAIL)
  #undef FLAG_NOT_AVAIL
#endif
#if defined(_WIN32) && defined(AGE_ALM_MASK)
  #undef AGE_ALM_MASK
#endif
#if defined(_WIN32) && defined(AGE_EPH_MASK)
  #undef AGE_EPH_MASK
#endif

  enum {
    FLAG_URA_MASK = 15u,
    FLAG_HEALTHY = 16u,
    FLAG_EPH_VAL = 32u,
    FLAG_ALM_VAL = 64u,
    FLAG_NOT_AVAIL = 128u,
    AGE_ALM_MASK = 15u,
    AGE_EPH_MASK = 240u,
  };


  typedef boost::shared_ptr< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> const> ConstPtr;

}; // struct RxmSVSI_SV_

typedef ::ublox_msgs::RxmSVSI_SV_<std::allocator<void> > RxmSVSI_SV;

typedef boost::shared_ptr< ::ublox_msgs::RxmSVSI_SV > RxmSVSI_SVPtr;
typedef boost::shared_ptr< ::ublox_msgs::RxmSVSI_SV const> RxmSVSI_SVConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator1> & lhs, const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator2> & rhs)
{
  return lhs.svid == rhs.svid &&
    lhs.svFlag == rhs.svFlag &&
    lhs.azim == rhs.azim &&
    lhs.elev == rhs.elev &&
    lhs.age == rhs.age;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator1> & lhs, const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ublox_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "055e3ca33052c1635aff80c3f8ab6197";
  }

  static const char* value(const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x055e3ca33052c163ULL;
  static const uint64_t static_value2 = 0x5aff80c3f8ab6197ULL;
};

template<class ContainerAllocator>
struct DataType< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ublox_msgs/RxmSVSI_SV";
  }

  static const char* value(const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# see message RxmSVSI\n"
"#\n"
"\n"
"uint8 svid            # Satellite ID\n"
"\n"
"uint8 svFlag          # Information Flags\n"
"uint8 FLAG_URA_MASK = 15      # Figure of Merit (URA) range 0..15\n"
"uint8 FLAG_HEALTHY = 16       # SV healthy flag\n"
"uint8 FLAG_EPH_VAL = 32       # Ephemeris valid\n"
"uint8 FLAG_ALM_VAL = 64       # Almanac valid\n"
"uint8 FLAG_NOT_AVAIL = 128    # SV not available\n"
"\n"
"int16 azim            # Azimuth\n"
"int8 elev             # Elevation\n"
"\n"
"uint8 age             # Age of Almanac and Ephemeris\n"
"uint8 AGE_ALM_MASK = 15       # Age of ALM in days offset by 4\n"
"                              # i.e. the reference time may be in the future:\n"
"                              # ageOfAlm = (age & 0x0f) - 4\n"
"uint8 AGE_EPH_MASK = 240      # Age of EPH in hours offset by 4.\n"
"                              # i.e. the reference time may be in the future:\n"
"                              # ageOfEph = ((age & 0xf0) >> 4) - 4\n"
;
  }

  static const char* value(const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.svid);
      stream.next(m.svFlag);
      stream.next(m.azim);
      stream.next(m.elev);
      stream.next(m.age);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RxmSVSI_SV_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ublox_msgs::RxmSVSI_SV_<ContainerAllocator>& v)
  {
    s << indent << "svid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.svid);
    s << indent << "svFlag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.svFlag);
    s << indent << "azim: ";
    Printer<int16_t>::stream(s, indent + "  ", v.azim);
    s << indent << "elev: ";
    Printer<int8_t>::stream(s, indent + "  ", v.elev);
    s << indent << "age: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.age);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UBLOX_MSGS_MESSAGE_RXMSVSI_SV_H