// Auto-generated. Do not edit!

// (in-package thorvald_sprayer.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class sprayer_controllerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.order = null;
      this.nodeID = null;
    }
    else {
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = '';
      }
      if (initObj.hasOwnProperty('nodeID')) {
        this.nodeID = initObj.nodeID
      }
      else {
        this.nodeID = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sprayer_controllerRequest
    // Serialize message field [order]
    bufferOffset = _serializer.string(obj.order, buffer, bufferOffset);
    // Serialize message field [nodeID]
    bufferOffset = _serializer.uint32(obj.nodeID, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sprayer_controllerRequest
    let len;
    let data = new sprayer_controllerRequest(null);
    // Deserialize message field [order]
    data.order = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [nodeID]
    data.nodeID = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.order.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'thorvald_sprayer/sprayer_controllerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '676304f02b97209d9bf7d76781b19ce3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string order
    uint32 nodeID
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sprayer_controllerRequest(null);
    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = ''
    }

    if (msg.nodeID !== undefined) {
      resolved.nodeID = msg.nodeID;
    }
    else {
      resolved.nodeID = 0
    }

    return resolved;
    }
};

class sprayer_controllerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sprayer_controllerResponse
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sprayer_controllerResponse
    let len;
    let data = new sprayer_controllerResponse(null);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'thorvald_sprayer/sprayer_controllerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5f003d6bcc824cbd51361d66d8e4f76c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string message
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sprayer_controllerResponse(null);
    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: sprayer_controllerRequest,
  Response: sprayer_controllerResponse,
  md5sum() { return 'd219122364590b6594a5c4f91ba561ca'; },
  datatype() { return 'thorvald_sprayer/sprayer_controller'; }
};
