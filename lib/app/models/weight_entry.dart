import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightEntry {
  final double weight;
  final Timestamp date;

  WeightEntry({@required this.weight, @required this.date});

  Map<String, dynamic> toMap() => {
        'weight': weight,
        'date': date.millisecondsSinceEpoch,
      };

  WeightEntry.fromMap(Map<String, dynamic> map)
      : weight = map['weight'],
        date = new Timestamp.fromMillisecondsSinceEpoch(map['date']);
}
