class UserMeasurements {
  final double neck;
  final double shoulders;
  final double chest;
  final double leftBicep;
  final double rightBicep;
  final double waist;
  final double hips;
  final double leftThigh;
  final double rightThigh;

  UserMeasurements({
    this.neck,
    this.shoulders,
    this.chest,
    this.leftBicep,
    this.rightBicep,
    this.waist,
    this.hips,
    this.leftThigh,
    this.rightThigh,
  });

  UserMeasurements.fromMap(Map<String, dynamic> data)
      : neck = data["neck"],
        shoulders = data["shoulders"],
        chest = data["chest"],
        leftBicep = data["leftBicep"],
        rightBicep = data["rightBicep"],
        waist = data["waist"],
        hips = data["hips"],
        leftThigh = data["leftThigh"],
        rightThigh = data["rightThigh"] {
    assert(data["neck"] != null, "neck is missing");
    assert(data["shoulders"] != null, "shoulders is missing");
    assert(data["chest"] != null, "chest is missing");
    assert(data["leftBicep"] != null, "leftBicep is missing");
    assert(data["rightBicep"] != null, "rightBicep is missing");
    assert(data["waist"] != null, "waist is missing");
    assert(data["hips"] != null, "hips is missing");
    assert(data["leftThigh"] != null, "leftThigh is missing");
    assert(data["rightThigh"] != null, "rightThigh is missing");
  }

  UserMeasurements.initial()
      : neck = 0.0,
        shoulders = 0.0,
        chest = 0.0,
        leftBicep = 0.0,
        rightBicep = 0.0,
        waist = 0.0,
        hips = 0.0,
        leftThigh = 0.0,
        rightThigh = 0.0;

  Map<String, dynamic> toMap() => {
        'neck': neck,
        'shoulders': shoulders,
        'chest': chest,
        'leftBicep': leftBicep,
        'rightBicep': rightBicep,
        'waist': waist,
        'hips': hips,
        'leftThigh': leftThigh,
        'rightThigh': rightThigh,
      };
}
