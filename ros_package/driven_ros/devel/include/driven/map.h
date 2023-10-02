// Generated by gencpp from file driven/map.msg
// DO NOT EDIT!


#ifndef DRIVEN_MESSAGE_MAP_H
#define DRIVEN_MESSAGE_MAP_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace driven
{
template <class ContainerAllocator>
struct map_
{
  typedef map_<ContainerAllocator> Type;

  map_()
    : x_lst()
    , y_lst()
    , car_x(0)
    , car_y(0)  {
    }
  map_(const ContainerAllocator& _alloc)
    : x_lst(_alloc)
    , y_lst(_alloc)
    , car_x(0)
    , car_y(0)  {
  (void)_alloc;
    }



   typedef std::vector<int16_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int16_t>> _x_lst_type;
  _x_lst_type x_lst;

   typedef std::vector<int16_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int16_t>> _y_lst_type;
  _y_lst_type y_lst;

   typedef int16_t _car_x_type;
  _car_x_type car_x;

   typedef int16_t _car_y_type;
  _car_y_type car_y;





  typedef boost::shared_ptr< ::driven::map_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::driven::map_<ContainerAllocator> const> ConstPtr;

}; // struct map_

typedef ::driven::map_<std::allocator<void> > map;

typedef boost::shared_ptr< ::driven::map > mapPtr;
typedef boost::shared_ptr< ::driven::map const> mapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::driven::map_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::driven::map_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::driven::map_<ContainerAllocator1> & lhs, const ::driven::map_<ContainerAllocator2> & rhs)
{
  return lhs.x_lst == rhs.x_lst &&
    lhs.y_lst == rhs.y_lst &&
    lhs.car_x == rhs.car_x &&
    lhs.car_y == rhs.car_y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::driven::map_<ContainerAllocator1> & lhs, const ::driven::map_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace driven

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::driven::map_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::driven::map_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::driven::map_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::driven::map_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::driven::map_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::driven::map_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::driven::map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "97eb6427ffcca94f25feb3e4b16337f3";
  }

  static const char* value(const ::driven::map_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x97eb6427ffcca94fULL;
  static const uint64_t static_value2 = 0x25feb3e4b16337f3ULL;
};

template<class ContainerAllocator>
struct DataType< ::driven::map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "driven/map";
  }

  static const char* value(const ::driven::map_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::driven::map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16[] x_lst\n"
"int16[] y_lst\n"
"int16 car_x\n"
"int16 car_y\n"
;
  }

  static const char* value(const ::driven::map_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::driven::map_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x_lst);
      stream.next(m.y_lst);
      stream.next(m.car_x);
      stream.next(m.car_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct map_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::driven::map_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::driven::map_<ContainerAllocator>& v)
  {
    s << indent << "x_lst[]" << std::endl;
    for (size_t i = 0; i < v.x_lst.size(); ++i)
    {
      s << indent << "  x_lst[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.x_lst[i]);
    }
    s << indent << "y_lst[]" << std::endl;
    for (size_t i = 0; i < v.y_lst.size(); ++i)
    {
      s << indent << "  y_lst[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.y_lst[i]);
    }
    s << indent << "car_x: ";
    Printer<int16_t>::stream(s, indent + "  ", v.car_x);
    s << indent << "car_y: ";
    Printer<int16_t>::stream(s, indent + "  ", v.car_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DRIVEN_MESSAGE_MAP_H