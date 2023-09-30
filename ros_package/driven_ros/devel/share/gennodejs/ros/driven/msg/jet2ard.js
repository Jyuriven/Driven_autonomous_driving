// Auto-generated. Do not edit!

// (in-package driven.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class jet2ard {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.throttle = null;
      this.brake = null;
      this.stop_sign = null;
      this.start_time = null;
    }
    else {
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0;
      }
      if (initObj.hasOwnProperty('stop_sign')) {
        this.stop_sign = initObj.stop_sign
      }
      else {
        this.stop_sign = 0;
      }
      if (initObj.hasOwnProperty('start_time')) {
        this.start_time = initObj.start_time
      }
      else {
        this.start_time = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type jet2ard
    // Serialize message field [throttle]
    bufferOffset = _serializer.int64(obj.throttle, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.int64(obj.brake, buffer, bufferOffset);
    // Serialize message field [stop_sign]
    bufferOffset = _serializer.int64(obj.stop_sign, buffer, bufferOffset);
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type jet2ard
    let len;
    let data = new jet2ard(null);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [stop_sign]
    data.stop_sign = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'driven/jet2ard';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '66290710e2d0e64ff792d8d065b9d5a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 throttle
    int64 brake
    int64 stop_sign
    time start_time
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new jet2ard(null);
    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0
    }

    if (msg.stop_sign !== undefined) {
      resolved.stop_sign = msg.stop_sign;
    }
    else {
      resolved.stop_sign = 0
    }

    if (msg.start_time !== undefined) {
      resolved.start_time = msg.start_time;
    }
    else {
      resolved.start_time = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = jet2ard;
