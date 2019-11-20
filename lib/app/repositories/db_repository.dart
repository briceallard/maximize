import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';

class DatabaseService with ChangeNotifier {
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  final Firestore _db;

  DatabaseService.instance() : _db = Firestore.instance;

  Stream<User> getUser(FirebaseUser fbUser) {
    if (fbUser == null) {
      return Stream.empty();
    }
    try {
      return _db
          .collection('users')
          .document(fbUser.uid)
          .snapshots()
          .map((snap) => User.fromMap(snap.data));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> createUser(FirebaseUser fbUser, User user) async {
    try {
      await _db.collection('users').document(fbUser.uid).setData(user.toMap());

      print('${user.fName} ${user.lName} successully added to Database!');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateTopLevel<T extends dynamic>(
      FirebaseUser user, String collection, T object) async {
    try {
      await _db
          .collection(collection)
          .document(user.uid)
          .updateData(object.toMap());
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<void> updateParent(FirebaseUser fbUser, User user) async =>
      await updateTopLevel(fbUser, "users", user);

  Stream getAllUsersStream() => _db
      .collection('users')
      .orderBy("displayName", descending: false)
      .snapshots();
}
