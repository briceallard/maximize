import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/repositories/db_repository.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _firebaseUser;
  DatabaseService _db = DatabaseService.instance();
  Status _status = Status.Uninitialized;

  AuthRepository.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get firebaseUser => _firebaseUser;

  /// Register a new [_user] to the [FirebaseAuth] using email and password.
  /// Will return [bool] true setting [Status] to [Status.Unauthenticated] upon success.
  /// Will return [bool] false setting [Status] to [Status.Unauthenticated] upon failure.
  ///
  /// Required pass in arguments:
  /// [String] fName, [String] lName, [String] email, [String] password
  Future<void> registerWithEmailAndPassword(User user, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      FirebaseUser firebaseUser = (await _auth.createUserWithEmailAndPassword(
              email: user.email, password: password))
          .user;

      user.uid = firebaseUser.uid;
      user.registerDate = Timestamp.now();
      user.lastLoggedIn = Timestamp.now();

      try {
        await _db.createUser(firebaseUser, user);
        user.save();
      } catch (e) {
        print(e.message);
      }

      _status = Status.Unauthenticated;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
    }
  }

  /// Sends [_user] a reset password email.
  ///
  /// Required pass in arguments:
  /// [String] email
  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  /// Sign in a [_user] to the [FirebaseAuth] using email and password.
  /// Will return [bool] true setting [Status] to [Status.Authenticating] upon success.
  /// Will return [bool] false setting [Status] to [Status.Unauthenticated] upon failure.
  ///
  /// Required pass in arguments:
  /// [String] email, [String] password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      FirebaseUser firebaseUser = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      print('User ${firebaseUser.uid} log in: SUCCESS');
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();

      print('User $email log in: FAILED');
      print(e);
      rethrow;
    }
  }

  /// Determines [_user] logged in status.
  /// Will return [bool] true if [_auth.currentUser()] != [null]
  bool isSignedIn() => _status == Status.Authenticated ? true : false;

  /// Signs out [_user] setting [Status.Unauthenticated] upon success.
  Future<void> signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
  }

  /// [Listenable] allowing state to monitor connection activity of [_user]
  /// setting [Status.Authenticated] if [FirebaseUser] != null.
  ///
  /// Required pass in arguments:
  /// [FirebaseUser] firebaseUser
  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _firebaseUser = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
