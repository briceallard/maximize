import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PhotoEntry {
  final Timestamp date;
  final String fileUrl;

  PhotoEntry({
    @required this.date,
    @required this.fileUrl,
  });

  Map<String, dynamic> toMap() => {
        'date': date.millisecondsSinceEpoch,
        'fileUrl': fileUrl,
      };

  PhotoEntry.fromMap(Map<String, dynamic> data)
      : date = new Timestamp.fromMillisecondsSinceEpoch(data['date']),
        fileUrl = data['fileUrl'];

  PhotoEntry.initial()
      : date = Timestamp.now(),
        fileUrl = 'No Photo';
}
