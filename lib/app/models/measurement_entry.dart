import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class MeasurementEntry {
  final Timestamp date;
  final double neck;
  final double shoulder;
  final double chest;
  final double leftBicep;
  final double rightBicep;
  final double waist;
  final double hips;
  final double leftThigh;
  final double rightThigh;
  final double leftCalf;
  final double rightCalf;

  MeasurementEntry({
    @required this.date,
    this.neck,
    this.shoulder,
    this.chest,
    this.leftBicep,
    this.rightBicep,
    this.waist,
    this.hips,
    this.leftThigh,
    this.rightThigh,
    this.leftCalf,
    this.rightCalf,
  });

  Map<String, dynamic> toMap() => {
        'date': date.millisecondsSinceEpoch,
        'neck': neck,
        'shoulder': shoulder,
        'chest': chest,
        'leftBicep': leftBicep,
        'rightBicep': rightBicep,
        'waist': waist,
        'hips': hips,
        'leftThigh': leftThigh,
        'rightThigh': rightThigh,
        'leftCalf': leftCalf,
        'rightCalf': rightCalf,
      };

  MeasurementEntry.fromMap(Map<String, dynamic> map)
      : date = new Timestamp.fromMillisecondsSinceEpoch(map['date']),
        neck = map['neck'],
        shoulder = map['shoulder'],
        chest = map['chest'],
        leftBicep = map['leftBicep'],
        rightBicep = map['rightBicep'],
        waist = map['waist'],
        hips = map['hips'],
        leftThigh = map['leftThigh'],
        rightThigh = map['rightThigh'],
        leftCalf = map['leftCalf'],
        rightCalf = map['rightCalf'];
}
