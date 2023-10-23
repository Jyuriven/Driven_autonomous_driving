// Auto-generated. Do not edit!

// (in-package ublox_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class NavRELPOSNED {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.version = null;
      this.reserved0 = null;
      this.refStationId = null;
      this.iTow = null;
      this.relPosN = null;
      this.relPosE = null;
      this.relPosD = null;
      this.relPosLength = null;
      this.relPosHeading = null;
      this.reserved1 = null;
      this.relPosHPN = null;
      this.relPosHPE = null;
      this.relPosHPD = null;
      this.relPosHPLength = null;
      this.accN = null;
      this.accE = null;
      this.accD = null;
      this.accLength = null;
      this.accHeading = null;
      this.reserved2 = null;
      this.flags = null;
    }
    else {
      if (initObj.hasOwnProperty('version')) {
        this.version = initObj.version
      }
      else {
        this.version = 0;
      }
      if (initObj.hasOwnProperty('reserved0')) {
        this.reserved0 = initObj.reserved0
      }
      else {
        this.reserved0 = 0;
      }
      if (initObj.hasOwnProperty('refStationId')) {
        this.refStationId = initObj.refStationId
      }
      else {
        this.refStationId = 0;
      }
      if (initObj.hasOwnProperty('iTow')) {
        this.iTow = initObj.iTow
      }
      else {
        this.iTow = 0;
      }
      if (initObj.hasOwnProperty('relPosN')) {
        this.relPosN = initObj.relPosN
      }
      else {
        this.relPosN = 0;
      }
      if (initObj.hasOwnProperty('relPosE')) {
        this.relPosE = initObj.relPosE
      }
      else {
        this.relPosE = 0;
      }
      if (initObj.hasOwnProperty('relPosD')) {
        this.relPosD = initObj.relPosD
      }
      else {
        this.relPosD = 0;
      }
      if (initObj.hasOwnProperty('relPosLength')) {
        this.relPosLength = initObj.relPosLength
      }
      else {
        this.relPosLength = 0;
      }
      if (initObj.hasOwnProperty('relPosHeading')) {
        this.relPosHeading = initObj.relPosHeading
      }
      else {
        this.relPosHeading = 0;
      }
      if (initObj.hasOwnProperty('reserved1')) {
        this.reserved1 = initObj.reserved1
      }
      else {
        this.reserved1 = 0;
      }
      if (initObj.hasOwnProperty('relPosHPN')) {
        this.relPosHPN = initObj.relPosHPN
      }
      else {
        this.relPosHPN = 0;
      }
      if (initObj.hasOwnProperty('relPosHPE')) {
        this.relPosHPE = initObj.relPosHPE
      }
      else {
        this.relPosHPE = 0;
      }
      if (initObj.hasOwnProperty('relPosHPD')) {
        this.relPosHPD = initObj.relPosHPD
      }
      else {
        this.relPosHPD = 0;
      }
      if (initObj.hasOwnProperty('relPosHPLength')) {
        this.relPosHPLength = initObj.relPosHPLength
      }
      else {
        this.relPosHPLength = 0;
      }
      if (initObj.hasOwnProperty('accN')) {
        this.accN = initObj.accN
      }
      else {
        this.accN = 0;
      }
      if (initObj.hasOwnProperty('accE')) {
        this.accE = initObj.accE
      }
      else {
        this.accE = 0;
      }
      if (initObj.hasOwnProperty('accD')) {
        this.accD = initObj.accD
      }
      else {
        this.accD = 0;
      }
      if (initObj.hasOwnProperty('accLength')) {
        this.accLength = initObj.accLength
      }
      else {
        this.accLength = 0;
      }
      if (initObj.hasOwnProperty('accHeading')) {
        this.accHeading = initObj.accHeading
      }
      else {
        this.accHeading = 0;
      }
      if (initObj.hasOwnProperty('reserved2')) {
        this.reserved2 = initObj.reserved2
      }
      else {
        this.reserved2 = 0;
      }
      if (initObj.hasOwnProperty('flags')) {
        this.flags = initObj.flags
      }
      else {
        this.flags = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavRELPOSNED
    // Serialize message field [version]
    bufferOffset = _serializer.uint8(obj.version, buffer, bufferOffset);
    // Serialize message field [reserved0]
    bufferOffset = _serializer.uint8(obj.reserved0, buffer, bufferOffset);
    // Serialize message field [refStationId]
    bufferOffset = _serializer.uint16(obj.refStationId, buffer, bufferOffset);
    // Serialize message field [iTow]
    bufferOffset = _serializer.uint32(obj.iTow, buffer, bufferOffset);
    // Serialize message field [relPosN]
    bufferOffset = _serializer.int32(obj.relPosN, buffer, bufferOffset);
    // Serialize message field [relPosE]
    bufferOffset = _serializer.int32(obj.relPosE, buffer, bufferOffset);
    // Serialize message field [relPosD]
    bufferOffset = _serializer.int32(obj.relPosD, buffer, bufferOffset);
    // Serialize message field [relPosLength]
    bufferOffset = _serializer.int32(obj.relPosLength, buffer, bufferOffset);
    // Serialize message field [relPosHeading]
    bufferOffset = _serializer.int32(obj.relPosHeading, buffer, bufferOffset);
    // Serialize message field [reserved1]
    bufferOffset = _serializer.uint32(obj.reserved1, buffer, bufferOffset);
    // Serialize message field [relPosHPN]
    bufferOffset = _serializer.int8(obj.relPosHPN, buffer, bufferOffset);
    // Serialize message field [relPosHPE]
    bufferOffset = _serializer.int8(obj.relPosHPE, buffer, bufferOffset);
    // Serialize message field [relPosHPD]
    bufferOffset = _serializer.int8(obj.relPosHPD, buffer, bufferOffset);
    // Serialize message field [relPosHPLength]
    bufferOffset = _serializer.uint8(obj.relPosHPLength, buffer, bufferOffset);
    // Serialize message field [accN]
    bufferOffset = _serializer.uint32(obj.accN, buffer, bufferOffset);
    // Serialize message field [accE]
    bufferOffset = _serializer.uint32(obj.accE, buffer, bufferOffset);
    // Serialize message field [accD]
    bufferOffset = _serializer.uint32(obj.accD, buffer, bufferOffset);
    // Serialize message field [accLength]
    bufferOffset = _serializer.uint32(obj.accLength, buffer, bufferOffset);
    // Serialize message field [accHeading]
    bufferOffset = _serializer.uint32(obj.accHeading, buffer, bufferOffset);
    // Serialize message field [reserved2]
    bufferOffset = _serializer.uint32(obj.reserved2, buffer, bufferOffset);
    // Serialize message field [flags]
    bufferOffset = _serializer.uint32(obj.flags, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavRELPOSNED
    let len;
    let data = new NavRELPOSNED(null);
    // Deserialize message field [version]
    data.version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [reserved0]
    data.reserved0 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [refStationId]
    data.refStationId = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [iTow]
    data.iTow = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [relPosN]
    data.relPosN = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [relPosE]
    data.relPosE = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [relPosD]
    data.relPosD = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [relPosLength]
    data.relPosLength = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [relPosHeading]
    data.relPosHeading = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [reserved1]
    data.reserved1 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [relPosHPN]
    data.relPosHPN = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [relPosHPE]
    data.relPosHPE = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [relPosHPD]
    data.relPosHPD = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [relPosHPLength]
    data.relPosHPLength = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accN]
    data.accN = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [accE]
    data.accE = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [accD]
    data.accD = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [accLength]
    data.accLength = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [accHeading]
    data.accHeading = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [reserved2]
    data.reserved2 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [flags]
    data.flags = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ublox_msgs/NavRELPOSNED';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '230f179ad5d03f7dffe9babdd98b23cc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # NAV-RELPOSNED (0x01 0x3C)
    # Relative Positioning Information in NED frame
    # 
    # The NED frame is defined as the local topological system at the reference
    # station. The relative position vector components in this message, along with
    # their associated accuracies, are given in that local topological system
    # This message contains the relative position vector from the Reference Station
    # to the Rover, including accuracy figures, in the local topological system
    # defined at the reference station
    #
    # Supported on:
    #  - u-blox 9 with protocol version 27.1 (only
    #    with High Precision GNSS products)
    #
    
    uint8 CLASS_ID = 1
    uint8 MESSAGE_ID = 60
    
    uint8 version                     # Message version (0x00 for this version)
    uint8 reserved0                   # Reserved
    uint16 refStationId               # Reference Station ID. Must be in the range 
                                      # 0..4095
    uint32 iTow                       # GPS time of week of the navigation epoch 
                                      # [ms]
    
    int32 relPosN                     # North component of relative position vector 
                                      # [cm]
    int32 relPosE                     # East component of relative position vector
                                      # [cm]
    int32 relPosD                     # Down component of relative position vector
                                      # [cm]
    int32 relPosLength
    
    int32 relPosHeading
    
    uint32 reserved1
    
    
    
    int8 relPosHPN                    # High-precision North component of relative
                                      # position vector. [0.1 mm]
                                      # Must be in the range -99 to +99.
                                      # The full North component of the relative
                                      # position vector, in units of cm, is given by
                                      # relPosN + (relPosHPN * 1e-2)
    int8 relPosHPE                    # High-precision East component of relative
                                      # position vector. [0.1 mm]
                                      # Must be in the range -99 to +99.
                                      # The full East component of the relative 
                                      # position vector, in units of cm, is given by
                                      # relPosE + (relPosHPE * 1e-2)
    int8 relPosHPD                    # High-precision Down component of relative
                                      # position vector. [0.1 mm]
                                      # Must be in the range -99 to +99.
                                      # The full Down component of the relative
                                      # position vector, in units of cm, is given by
                                      # relPosD + (relPosHPD * 1e-2)
    
    uint8 relPosHPLength
    
    uint32 accN                       # Accuracy of relative position North 
                                      # component [0.1 mm]
    uint32 accE                       # Accuracy of relative position East component
                                      # [0.1 mm]
    uint32 accD                       # Accuracy of relative position Down component
                                      # [0.1 mm]
    
    uint32 accLength
    
    uint32 accHeading
    
    uint32 reserved2
    
    uint32 flags
    uint32 FLAGS_GNSS_FIX_OK = 1      # A valid fix (i.e within DOP & accuracy 
                                      # masks)
    uint32 FLAGS_DIFF_SOLN = 2        # Set if differential corrections were applied
    uint32 FLAGS_REL_POS_VALID = 4    # Set if relative position components and
                                      # accuracies are valid
    uint32 FLAGS_CARR_SOLN_MASK = 24  # Carrier phase range solution status:
    uint32 FLAGS_CARR_SOLN_NONE = 0     # No carrier phase range solution
    uint32 FLAGS_CARR_SOLN_FLOAT = 8    # Float solution. No fixed integer carrier 
                                        # phase measurements have been used to
                                        # calculate the solution
    uint32 FLAGS_CARR_SOLN_FIXED = 16   # Fixed solution. One or more fixed
                                        # integer carrier phase range measurements
                                        # have been used to calculate the solution
    uint32 FLAGS_IS_MOVING = 32       # if the receiver is operating in moving 
                                      # baseline mode (not supported in protocol
                                      # versions less than 20.3)
    uint32 FLAGS_REF_POS_MISS = 64    # Set if extrapolated reference position was
                                      # used to compute moving baseline solution 
                                      # this epoch (not supported in protocol
                                      # versions less than 20.3)  
    uint32 FLAGS_REF_OBS_MISS = 128   # Set if extrapolated reference observations
                                      # were used to compute moving baseline
                                      # solution this epoch (not supported in
                                      # protocol versions less than 20.3)
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavRELPOSNED(null);
    if (msg.version !== undefined) {
      resolved.version = msg.version;
    }
    else {
      resolved.version = 0
    }

    if (msg.reserved0 !== undefined) {
      resolved.reserved0 = msg.reserved0;
    }
    else {
      resolved.reserved0 = 0
    }

    if (msg.refStationId !== undefined) {
      resolved.refStationId = msg.refStationId;
    }
    else {
      resolved.refStationId = 0
    }

    if (msg.iTow !== undefined) {
      resolved.iTow = msg.iTow;
    }
    else {
      resolved.iTow = 0
    }

    if (msg.relPosN !== undefined) {
      resolved.relPosN = msg.relPosN;
    }
    else {
      resolved.relPosN = 0
    }

    if (msg.relPosE !== undefined) {
      resolved.relPosE = msg.relPosE;
    }
    else {
      resolved.relPosE = 0
    }

    if (msg.relPosD !== undefined) {
      resolved.relPosD = msg.relPosD;
    }
    else {
      resolved.relPosD = 0
    }

    if (msg.relPosLength !== undefined) {
      resolved.relPosLength = msg.relPosLength;
    }
    else {
      resolved.relPosLength = 0
    }

    if (msg.relPosHeading !== undefined) {
      resolved.relPosHeading = msg.relPosHeading;
    }
    else {
      resolved.relPosHeading = 0
    }

    if (msg.reserved1 !== undefined) {
      resolved.reserved1 = msg.reserved1;
    }
    else {
      resolved.reserved1 = 0
    }

    if (msg.relPosHPN !== undefined) {
      resolved.relPosHPN = msg.relPosHPN;
    }
    else {
      resolved.relPosHPN = 0
    }

    if (msg.relPosHPE !== undefined) {
      resolved.relPosHPE = msg.relPosHPE;
    }
    else {
      resolved.relPosHPE = 0
    }

    if (msg.relPosHPD !== undefined) {
      resolved.relPosHPD = msg.relPosHPD;
    }
    else {
      resolved.relPosHPD = 0
    }

    if (msg.relPosHPLength !== undefined) {
      resolved.relPosHPLength = msg.relPosHPLength;
    }
    else {
      resolved.relPosHPLength = 0
    }

    if (msg.accN !== undefined) {
      resolved.accN = msg.accN;
    }
    else {
      resolved.accN = 0
    }

    if (msg.accE !== undefined) {
      resolved.accE = msg.accE;
    }
    else {
      resolved.accE = 0
    }

    if (msg.accD !== undefined) {
      resolved.accD = msg.accD;
    }
    else {
      resolved.accD = 0
    }

    if (msg.accLength !== undefined) {
      resolved.accLength = msg.accLength;
    }
    else {
      resolved.accLength = 0
    }

    if (msg.accHeading !== undefined) {
      resolved.accHeading = msg.accHeading;
    }
    else {
      resolved.accHeading = 0
    }

    if (msg.reserved2 !== undefined) {
      resolved.reserved2 = msg.reserved2;
    }
    else {
      resolved.reserved2 = 0
    }

    if (msg.flags !== undefined) {
      resolved.flags = msg.flags;
    }
    else {
      resolved.flags = 0
    }

    return resolved;
    }
};

// Constants for message
NavRELPOSNED.Constants = {
  CLASS_ID: 1,
  MESSAGE_ID: 60,
  FLAGS_GNSS_FIX_OK: 1,
  FLAGS_DIFF_SOLN: 2,
  FLAGS_REL_POS_VALID: 4,
  FLAGS_CARR_SOLN_MASK: 24,
  FLAGS_CARR_SOLN_NONE: 0,
  FLAGS_CARR_SOLN_FLOAT: 8,
  FLAGS_CARR_SOLN_FIXED: 16,
  FLAGS_IS_MOVING: 32,
  FLAGS_REF_POS_MISS: 64,
  FLAGS_REF_OBS_MISS: 128,
}

module.exports = NavRELPOSNED;
