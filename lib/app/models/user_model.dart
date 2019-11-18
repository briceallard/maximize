import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class User {
  String fName;
  String lName;
  String displayName;
  String email;
  String sex;
  String uid;
  bool isAdmin;
  double currentWeight;
  double goalWeight;
  double currentHeight;
  Timestamp registerDate;
  Timestamp lastLoggedIn;
  List<dynamic> workoutHistory;
  List<dynamic> weightHistory;
  List<dynamic> userMeasurements;

  User({
    @required this.fName,
    @required this.lName,
    @required this.displayName,
    @required this.email,
    this.sex,
    @required this.uid,
    this.isAdmin,
    this.currentWeight,
    this.goalWeight,
    this.currentHeight,
    @required this.registerDate,
    @required this.lastLoggedIn,
    this.workoutHistory,
    this.weightHistory,
    this.userMeasurements,
  });

  User.fromMap(Map<String, dynamic> data)
      : fName = data["fName"],
        lName = data["lName"],
        displayName = data["displayName"],
        email = data["email"],
        sex = data["sex"],
        uid = data["uid"],
        isAdmin = data["isAdmin"],
        currentWeight = data["currentWeight"],
        goalWeight = data["goalWeight"],
        currentHeight = data["currentHeight"],
        registerDate = data["registerDate"],
        lastLoggedIn = data["lastLoggedIn"],
        workoutHistory = data["workoutHistory"],
        weightHistory = data["weightHistory"],
        userMeasurements = data["userMeasurements"] {
    assert(data['fName'] != null, "fName is missing");
    assert(data['lName'] != null, "lName is missing");
    assert(data['displayName'] != null, "displayName is missing");
    assert(data['email'] != null, "email is missing");
    assert(data['sex'] != null, "sex is missing");
    assert(data['uid'] != null, "uid is missing");
    assert(data['isAdmin'] != null, "isAdmin is missing");
    assert(data['currentWeight'] != null, "currentWeight is missing");
    assert(data['goalWeight'] != null, "goalWeight is missing");
    assert(data['currentHeight'] != null, "currentHeight is missing");
    assert(data['registerDate'] != null, "registerDate is missing");
    assert(data['lastLoggedIn'] != null, "lastLoggedIn is missing");
    assert(data['workoutHistory'] != null, "workoutHistory is missing");
    assert(data['weightHistory'] != null, "weightHistory is missing");
    assert(data['userMeasurements'] != null, "userMeasurements is missing");
  }

  User.initial()
      : fName = "No first name",
        lName = "No last name",
        displayName = "No user",
        email = "No user",
        sex = "No sex",
        uid = "No user",
        isAdmin = false,
        currentWeight = 0.0,
        goalWeight = 0.0,
        currentHeight = 0.0,
        registerDate = null,
        lastLoggedIn = null,
        workoutHistory = null,
        weightHistory = null,
        userMeasurements = null;

  Map<String, dynamic> toMap() => {
        'fName': fName,
        'lName': lName,
        'displayName': displayName,
        'email': email,
        'sex': sex,
        'uid': uid,
        'isAdmin': isAdmin ?? false,
        'currentWeight': currentWeight ?? 0.0,
        'goalWeight': goalWeight ?? 0.0,
        'currentHeight': currentHeight ?? 0.0,
        'registerDate': registerDate,
        'lastLoggedIn': lastLoggedIn,
        'workoutHistory': workoutHistory ?? [],
        'weightHistory': weightHistory ?? [],
        'userMeasurements': userMeasurements ?? [],
      };

  save() {
    print('User saved as:');
    print('Name: $fName $lName');
    print('Email: $email');
    print('Sex: $sex');
    print('UID: $uid');
    print('Admin: $isAdmin');
    print('Current Weight: $currentWeight');
    print('Goal Weight: $goalWeight');
    print('Current Height: $currentHeight');
    print('Register Date: $registerDate');
    print('Last Logged In: $lastLoggedIn');
    print('Workout History: $workoutHistory');
    print('Weight History: $weightHistory');
    print('User Measurements: $userMeasurements');
  }
}
