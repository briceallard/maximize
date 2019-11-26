import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maximize/app/models/photo_entry.dart';
import 'package:maximize/app/models/user_model.dart';
import 'package:maximize/app/repositories/auth_repository.dart';
import 'package:maximize/app/utils/constants/resources.dart';
import 'package:provider/provider.dart';

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

  Future<void> uploadImage(User user, FirebaseUser fbUser, File image) async {
    try {
      String filename = DateTime.now().millisecondsSinceEpoch.toString();

      StorageReference ref =
          _storage.ref().child('images/${user.uid}/$filename.jpg');
      StorageUploadTask uploadTask = ref.putFile(image);
      StorageTaskSnapshot taskSnapshot = (await uploadTask.onComplete);

      String _fileUrl = await taskSnapshot.ref.getDownloadURL();

      user.photos.add(PhotoEntry(
        date: Timestamp.now(),
        fileUrl: _fileUrl,
      ));

      await updateParent(fbUser, user);
    } catch (e) {
      print(e);
      rethrow;
    }

    return null;
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

  Stream<List<PhotoEntry>> getUserPhotosStream(FirebaseUser fbUser) {
    print(fbUser);
    if (fbUser == null) {
      return Stream.empty();
    }
    try {
      return _db
          .collection('users')
          .document(fbUser.uid)
          .collection('photos')
          .snapshots()
          .map((list) => list.documents
              .map((doc) => PhotoEntry.fromMap(doc.data))
              .toList());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
