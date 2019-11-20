import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class WorkoutEntry {
  final String title;
  final double repititions;
  final double weight;
  final Timestamp date;

  /// duration
  /// sets

  WorkoutEntry({
    @required this.title,
    @required this.repititions,
    @required this.weight,
    @required this.date,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'repititions': repititions,
        'weight': weight,
        'date': date.millisecondsSinceEpoch,
      };

  WorkoutEntry.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        repititions = map['repititions'],
        weight = map['weight'],
        date = new Timestamp.fromMillisecondsSinceEpoch(map['date']);
}
