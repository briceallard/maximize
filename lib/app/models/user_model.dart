import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maximize/app/models/measurement_entry.dart';
import 'package:maximize/app/models/photo_entry.dart';
import 'package:maximize/app/models/schedule_entry.dart';
import 'package:maximize/app/models/weight_entry.dart';
import 'package:maximize/app/models/workout_entry.dart';
import 'package:meta/meta.dart';

class User {
  String fName;
  String lName;
  String displayName;
  String email;
  String sex;
  String uid;
  String profileImage;
  bool isAdmin;
  double goalWeight;
  double height;
  Timestamp registerDate;
  Timestamp lastLoggedIn;
  List<PhotoEntry> photos;
  List<ScheduleEntry> schedule;
  List<WorkoutEntry> workoutHistory;
  List<WeightEntry> weightHistory;
  List<MeasurementEntry> measurementHistory;

  User({
    @required this.fName,
    @required this.lName,
    @required this.displayName,
    @required this.email,
    @required this.sex,
    @required this.uid,
    this.profileImage,
    this.isAdmin,
    this.goalWeight,
    this.height,
    this.registerDate,
    this.lastLoggedIn,
    this.photos,
    this.schedule,
    this.workoutHistory,
    this.weightHistory,
    this.measurementHistory,
  });

  PhotoEntry get mostRecentPhoto => photos[photos.length - 1];

  WorkoutEntry get mostRecentWorkout =>
      workoutHistory[workoutHistory.length - 1];

  WeightEntry currentWeight() {
    if (weightHistory.isEmpty) {
      return WeightEntry(date: Timestamp.now(), weight: 0.0);
    }
    return weightHistory[weightHistory.length - 1];
  }

  MeasurementEntry get currentMeasurement =>
      measurementHistory[measurementHistory.length - 1];

  User.fromMap(Map<String, dynamic> data)
      : fName = data["fName"],
        lName = data["lName"],
        displayName = data["displayName"],
        email = data["email"],
        sex = data["sex"],
        uid = data["uid"],
        profileImage = data['profileImage'],
        isAdmin = data["isAdmin"],
        goalWeight = data["goalWeight"],
        height = data["height"],
        registerDate = data["registerDate"],
        lastLoggedIn = data["lastLoggedIn"],
        photos = User.photosListOfMapsToList(
          data["photos"],
        ),
        schedule = User.scheduleListOfMapsToList(
          data["schedule"],
        ),
        workoutHistory = User.workoutHistoryListOfMapsToList(
          data["workoutHistory"],
        ),
        weightHistory = User.weightHistoryListOfMapsToList(
          data["weightHistory"],
        ),
        measurementHistory = User.measurementHistoryListOfMapsToList(
          data["measurementHistory"],
        ) {
    assert(data['fName'] != null, "fName is missing");
    assert(data['lName'] != null, "lName is missing");
    assert(data['displayName'] != null, "displayName is missing");
    assert(data['email'] != null, "email is missing");
    assert(data['sex'] != null, "sex is missing");
    assert(data['uid'] != null, "uid is missing");
    assert(data['profileImage'] != null, 'profileImage is missing');
    assert(data['isAdmin'] != null, "isAdmin is missing");
    assert(data['goalWeight'] != null, "goalWeight is missing");
    assert(data['height'] != null, "height is missing");
    assert(data['registerDate'] != null, "registerDate is missing");
    assert(data['lastLoggedIn'] != null, "lastLoggedIn is missing");
    assert(data['photos'] != null, "photos is missing");
    assert(data['schedule'] != null, "schedule is missing");
    assert(data['workoutHistory'] != null, "workoutHistory is missing");
    assert(data['weightHistory'] != null, "weightHistory is missing");
    assert(data['measurementHistory'] != null, "measurementHistory is missing");
  }

  /// Starting with a [LinkedHashMap], iterate through the list, converting to
  /// a regular [Map] which is used to create an iterable [List<dynamic>].
  /// Lastly, cast the dynamic list to a [List<WeightEntry>].

  static List<PhotoEntry> photosListOfMapsToList(map) => map
      .map((ph) => PhotoEntry.fromMap(Map<String, dynamic>.from(ph)))
      .toList()
      .cast<PhotoEntry>();

  static List<ScheduleEntry> scheduleListOfMapsToList(map) => map
      .map((sch) => ScheduleEntry.fromMap(Map<String, dynamic>.from(sch)))
      .toList()
      .cast<ScheduleEntry>();

  static List<WorkoutEntry> workoutHistoryListOfMapsToList(map) => map
      .map((wh) => WorkoutEntry.fromMap(Map<String, dynamic>.from(wh)))
      .toList()
      .cast<WorkoutEntry>();

  static List<WeightEntry> weightHistoryListOfMapsToList(map) => map
      .map((wh) => WeightEntry.fromMap(Map<String, dynamic>.from(wh)))
      .toList()
      .cast<WeightEntry>();

  static List<MeasurementEntry> measurementHistoryListOfMapsToList(map) => map
      .map((mh) => MeasurementEntry.fromMap(Map<String, dynamic>.from(mh)))
      .toList()
      .cast<MeasurementEntry>();

  User.initial()
      : fName = "No first name",
        lName = "No last name",
        displayName = "No user",
        email = "No user",
        sex = "No sex",
        uid = "No user",
        profileImage = "No profile image",
        isAdmin = false,
        goalWeight = 0.0,
        height = 0.0,
        registerDate = Timestamp.now(),
        lastLoggedIn = Timestamp.now(),
        photos = [],
        schedule = [],
        workoutHistory = [],
        weightHistory = [],
        measurementHistory = [];

  Map<String, dynamic> toMap() => {
        'fName': fName,
        'lName': lName,
        'displayName': displayName,
        'email': email,
        'sex': sex,
        'uid': uid,
        'profileImage': profileImage,
        'isAdmin': isAdmin ?? false,
        'goalWeight': goalWeight ?? 0.0,
        'height': height ?? 0.0,
        'registerDate': registerDate,
        'lastLoggedIn': lastLoggedIn,
        'photos': photos.map((ph) => ph.toMap()).toList(),
        'schedule': schedule.map((sch) => sch.toMap()).toList(),
        'workoutHistory': workoutHistory.map((wh) => wh.toMap()).toList(),
        'weightHistory': weightHistory.map((wh) => wh.toMap()).toList(),
        'measurementHistory':
            measurementHistory.map((mh) => mh.toMap()).toList(),
      };

  save() {
    print('User saved as - ');
    print('Name: $fName $lName');
    print('Email: $email');
    print('Sex: $sex');
    print('UID: $uid');
    print('Admin: $isAdmin');
    print('Current Weight: ${currentWeight().weight}');
    print('Goal Weight: $goalWeight');
    print('Current Height: $height');
    print('Register Date: $registerDate');
    print('Last Logged In: $lastLoggedIn');
    print('Last Logged In: $schedule');
    print('Workout History: $workoutHistory');
    print('Weight History: $weightHistory');
    print('User Measurements: $measurementHistory');
  }
}
