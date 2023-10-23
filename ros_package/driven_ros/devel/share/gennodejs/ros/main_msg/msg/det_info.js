// Auto-generated. Do not edit!

// (in-package main_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class det_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.emg_stop = null;
      this.stop_rate = null;
    }
    else {
      if (initObj.hasOwnProperty('emg_stop')) {
        this.emg_stop = initObj.emg_stop
      }
      else {
        this.emg_stop = 0;
      }
      if (initObj.hasOwnProperty('stop_rate')) {
        this.stop_rate = initObj.stop_rate
      }
      else {
        this.stop_rate = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type det_info
    // Serialize message field [emg_stop]
    bufferOffset = _serializer.int16(obj.emg_stop, buffer, bufferOffset);
    // Serialize message field [stop_rate]
    bufferOffset = _serializer.int16(obj.stop_rate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type det_info
    let len;
    let data = new det_info(null);
    // Deserialize message field [emg_stop]
    data.emg_stop = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [stop_rate]
    data.stop_rate = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'main_msg/det_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8fe94a38075b37159e1d95c90bacc07a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 emg_stop
    int16 stop_rate
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new det_info(null);
    if (msg.emg_stop !== undefined) {
      resolved.emg_stop = msg.emg_stop;
    }
    else {
      resolved.emg_stop = 0
    }

    if (msg.stop_rate !== undefined) {
      resolved.stop_rate = msg.stop_rate;
    }
    else {
      resolved.stop_rate = 0
    }

    return resolved;
    }
};

module.exports = det_info;
