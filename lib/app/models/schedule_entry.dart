import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class ScheduleEntry {
  final String title;
  final String description;
  final Timestamp date;
  final bool isComplete;
  final bool isReminder;
  final Timestamp reminderDate;
  final bool isRepeat;

  ScheduleEntry({
    @required this.title,
    this.description,
    @required this.date,
    this.isComplete,
    this.isReminder,
    this.reminderDate,
    this.isRepeat,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'date': date.millisecondsSinceEpoch,
        'isComplete': isComplete,
        'isReminder': isReminder,
        'reminderDate': reminderDate.millisecondsSinceEpoch,
        'isRepeat': isRepeat,
      };

  ScheduleEntry.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        description = map['description'],
        date = new Timestamp.fromMillisecondsSinceEpoch(map['date']),
        isComplete = map['isComplete'],
        isReminder = map['isReminder'],
        reminderDate = map['reminderDate'],
        isRepeat = map['isRepeat'];
}
