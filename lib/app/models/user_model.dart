import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maximize/app/models/weight_entry.dart';
import 'package:meta/meta.dart';

class User {
  String fName;
  String lName;
  String displayName;
  String email;
  String sex;
  String uid;
  bool isAdmin;
  double goalWeight;
  double height;
  Timestamp registerDate;
  Timestamp lastLoggedIn;
  List<dynamic> workoutHistory;
  List<WeightEntry> weightHistory;
  List<dynamic> userMeasurements;

  User({
    @required this.fName,
    @required this.lName,
    @required this.displayName,
    @required this.email,
    this.sex,
    @required this.uid,
    this.isAdmin,
    this.goalWeight,
    this.height,
    @required this.registerDate,
    @required this.lastLoggedIn,
    this.workoutHistory,
    this.weightHistory,
    this.userMeasurements,
  });

  double get currentWeight => weightHistory[weightHistory.length - 1].weight;

  User.fromMap(Map<String, dynamic> data)
      : fName = data[
            "fName"], // this is where it's throwing, because it isn't being stored in the database ... it might be the authrepository, whoever is calling this is passing null
        lName = data["lName"],
        displayName = data["displayName"],
        email = data["email"],
        sex = data["sex"],
        uid = data["uid"],
        isAdmin = data["isAdmin"],
        goalWeight = data["goalWeight"],
        height = data["height"],
        registerDate = data["registerDate"],
        lastLoggedIn = data["lastLoggedIn"],
        workoutHistory = data["workoutHistory"],
        weightHistory =
            User.weightHistoryListOfMapsToList(data["weightHistory"]),
        userMeasurements = data["userMeasurements"] {
    assert(data['fName'] != null, "fName is missing");
    assert(data['lName'] != null, "lName is missing");
    assert(data['displayName'] != null, "displayName is missing");
    assert(data['email'] != null, "email is missing");
    assert(data['sex'] != null, "sex is missing");
    assert(data['uid'] != null, "uid is missing");
    assert(data['isAdmin'] != null, "isAdmin is missing");
    assert(data['goalWeight'] != null, "goalWeight is missing");
    assert(data['height'] != null, "height is missing");
    assert(data['registerDate'] != null, "registerDate is missing");
    assert(data['lastLoggedIn'] != null, "lastLoggedIn is missing");
    assert(data['workoutHistory'] != null, "workoutHistory is missing");
    assert(data['weightHistory'] != null, "weightHistory is missing");
    assert(data['userMeasurements'] != null, "userMeasurements is missing");
  }

  // you start with a list of linkedhashmaps
  // go through the list, convert to a regular map, then use that map to create a weight entry
  // now you have an iterable of dynamic
  // convert the iterable entry to a real list
  // cast it from list<dynamic> to list<WeightEntry>
  static List<WeightEntry> weightHistoryListOfMapsToList(map) => map
      .map((wh) => WeightEntry.fromMap(Map<String, dynamic>.from(wh)))
      .toList()
      .cast<WeightEntry>();

  User.initial()
      : fName = "No first name",
        lName = "No last name",
        displayName = "No user",
        email = "No user",
        sex = "No sex",
        uid = "No user",
        isAdmin = false,
        goalWeight = 0.0,
        height = 0.0,
        registerDate = Timestamp.now(),
        lastLoggedIn = Timestamp.now(),
        workoutHistory = [],
        weightHistory = [],
        userMeasurements = [];

  Map<String, dynamic> toMap() => {
        'fName': fName,
        'lName': lName,
        'displayName': displayName,
        'email': email,
        'sex': sex,
        'uid': uid,
        'isAdmin': isAdmin ?? false,
        'goalWeight': goalWeight ?? 0.0,
        'height': height ?? 0.0,
        'registerDate': registerDate,
        'lastLoggedIn': lastLoggedIn,
        'workoutHistory': workoutHistory ?? [],
        'weightHistory': weightHistory.map((wh) => wh.toMap()).toList(),
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
    print('Current Height: $height');
    print('Register Date: $registerDate');
    print('Last Logged In: $lastLoggedIn');
    print('Workout History: $workoutHistory');
    print('Weight History: $weightHistory');
    print('User Measurements: $userMeasurements');
  }
}
