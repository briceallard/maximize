import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/utils/constants/resources.dart';

class DatabaseService with ChangeNotifier {
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  final Firestore _db;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  Future<String> uploadProfilePicture(String uid, File image) async {
    if (image != null) {
      try {
        String filename = DateTime.now().millisecondsSinceEpoch.toString();

        StorageReference ref = _storage.ref().child('images/$uid/$filename.jpg');
        StorageUploadTask uploadTask = ref.putFile(image);
        StorageTaskSnapshot taskSnapshot = (await uploadTask.onComplete);

        return (await taskSnapshot.ref.getDownloadURL());
      } catch (e) {
        print(e);
        rethrow;
      }
    } else {
      return Resources.default_profile;
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
