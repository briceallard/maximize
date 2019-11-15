import 'package:cloud_firestore/cloud_firestore.dart';

class UserWeights {
  double currentWeight;
  double goalWeight;
  Map<double, Timestamp> weightHistory;

  UserWeights({
    this.currentWeight,
    this.goalWeight,
    this.weightHistory,
  });

  UserWeights.fromMap(Map<String, dynamic> data)
      : currentWeight = data["currentWeight"],
        goalWeight = data["goalWeight"],
        weightHistory = data["weightHistory"] {
    assert(data["currentWeight"] != null, "currentWeight is missing");
    assert(data["goalWeight"] != null, "goalWeight is missing");
    assert(data["weightHistory"] != null, "weightHistory is missing");
  }

  UserWeights.initial()
      : currentWeight = 0.0,
        goalWeight = 0.0,
        weightHistory = new Map<double, Timestamp>();

  Map<String, dynamic> toMap() => {
        'currentWeight': currentWeight,
        'goalWeight': goalWeight,
        'weightHistory': weightHistory,
      };
}
