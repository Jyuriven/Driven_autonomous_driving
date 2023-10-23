// Auto-generated. Do not edit!

// (in-package cloud_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class g_map {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_lst = null;
      this.y_lst = null;
      this.car_x = null;
      this.car_y = null;
    }
    else {
      if (initObj.hasOwnProperty('x_lst')) {
        this.x_lst = initObj.x_lst
      }
      else {
        this.x_lst = [];
      }
      if (initObj.hasOwnProperty('y_lst')) {
        this.y_lst = initObj.y_lst
      }
      else {
        this.y_lst = [];
      }
      if (initObj.hasOwnProperty('car_x')) {
        this.car_x = initObj.car_x
      }
      else {
        this.car_x = 0;
      }
      if (initObj.hasOwnProperty('car_y')) {
        this.car_y = initObj.car_y
      }
      else {
        this.car_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type g_map
    // Serialize message field [x_lst]
    bufferOffset = _arraySerializer.int64(obj.x_lst, buffer, bufferOffset, null);
    // Serialize message field [y_lst]
    bufferOffset = _arraySerializer.int64(obj.y_lst, buffer, bufferOffset, null);
    // Serialize message field [car_x]
    bufferOffset = _serializer.int16(obj.car_x, buffer, bufferOffset);
    // Serialize message field [car_y]
    bufferOffset = _serializer.int16(obj.car_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type g_map
    let len;
    let data = new g_map(null);
    // Deserialize message field [x_lst]
    data.x_lst = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [y_lst]
    data.y_lst = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [car_x]
    data.car_x = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [car_y]
    data.car_y = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.x_lst.length;
    length += 8 * object.y_lst.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cloud_msgs/g_map';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '841c3629304d075e0a764e23d33792d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] x_lst
    int64[] y_lst
    int16 car_x
    int16 car_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new g_map(null);
    if (msg.x_lst !== undefined) {
      resolved.x_lst = msg.x_lst;
    }
    else {
      resolved.x_lst = []
    }

    if (msg.y_lst !== undefined) {
      resolved.y_lst = msg.y_lst;
    }
    else {
      resolved.y_lst = []
    }

    if (msg.car_x !== undefined) {
      resolved.car_x = msg.car_x;
    }
    else {
      resolved.car_x = 0
    }

    if (msg.car_y !== undefined) {
      resolved.car_y = msg.car_y;
    }
    else {
      resolved.car_y = 0
    }

    return resolved;
    }
};

module.exports = g_map;
