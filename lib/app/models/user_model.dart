import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class User {
  String fName;
  String lName;
  String displayName;
  String email;
  String uid;
  bool isAdmin;
  double currentWeight;
  double goalWeight;
  Timestamp registerDate;
  Timestamp lastLoggedIn;
  List<dynamic> workoutHistory;
  List<dynamic> weightHistory;

  User({
    @required this.fName,
    @required this.lName,
    @required this.displayName,
    @required this.email,
    @required this.uid,
    this.isAdmin,
    this.currentWeight,
    this.goalWeight,
    @required this.registerDate,
    @required this.lastLoggedIn,
    this.workoutHistory,
    this.weightHistory,
  });

  User.fromMap(Map<String, dynamic> data)
      : fName = data["fName"],
        lName = data["lName"],
        displayName = data["displayName"],
        email = data["email"],
        uid = data["uid"],
        isAdmin = data["isAdmin"],
        currentWeight = data["currentWeight"],
        goalWeight = data["goalWeight"],
        registerDate = data["registerDate"],
        lastLoggedIn = data["lastLoggedIn"],
        workoutHistory = data["workoutHistory"],
        weightHistory = data["weightHistory"] {
    assert(data['fName'] != null, "fName is missing");
    assert(data['lName'] != null, "lName is missing");
    assert(data['displayName'] != null, "displayName is missing");
    assert(data['email'] != null, "email is missing");
    assert(data['uid'] != null, "uid is missing");
    assert(data['isAdmin'] != null, "isAdmin is missing");
    assert(data['currentWeight'] != null, "currentWeight is missing");
    assert(data['goalWeight'] != null, "goalWeight is missing");
    assert(data['registerDate'] != null, "registerDate is missing");
    assert(data['lastLoggedIn'] != null, "lastLoggedIn is missing");
    assert(data['workoutHistory'] != null, "workoutHistory is missing");
    assert(data['weightHistory'] != null, "weightHistory is missing");
  }

  User.initial()
      : fName = "No first name",
        lName = "No last name",
        displayName = "No user",
        email = "No user",
        uid = "No user",
        isAdmin = false,
        currentWeight = 0.0,
        goalWeight = 0.0,
        registerDate = null,
        lastLoggedIn = null,
        workoutHistory = null,
        weightHistory = null;

  Map<String, dynamic> toMap() => {
        'fName': fName,
        'lName': lName,
        'displayName': displayName,
        'email': email,
        'uid': uid,
        'isAdmin': isAdmin ?? false,
        'currentWeight': currentWeight ?? 0.0,
        'goalWeight': goalWeight ?? 0.0,
        'registerDate': registerDate,
        'lastLoggedIn': lastLoggedIn,
        'workoutHistory': workoutHistory ?? [],
        'weightHistory': weightHistory ?? [],
      };

    save() {
      print('User saved as:');
      print('$fName $lName');
      print('$email');
    }
}
