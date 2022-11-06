class Measurement {
  String _id;
  float _distance;
  Measurement(String id, float distance) {
    this._id = id;
    this._distance = distance;
  }

  float getDistance() {
    return this._distance;
  }

  String getId() {
    return this._id;
  }

  void sendOverOsc(OscP5 oscP5) {
    OscMessage myMessage = new OscMessage("/distance/"+this._id);
    myMessage.add(this._distance);
    println("/distance/"+this._id,this._distance);
    oscP5.send(myMessage, myRemoteLocation);
  }

  void log() {
    println(this._id, this._distance);
  }
}
