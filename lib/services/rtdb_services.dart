// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:database/models/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';

class DBService {
  static const String baseUrl = 'jsonplaceholder.typicode.com';
  static final FirebaseDatabase db = FirebaseDatabase.instance;

  static Future downloadAndUpload() async {
    final userUri = Uri.https(baseUrl, 'users');
    final postUri = Uri.https(baseUrl, 'posts');
    final todosUri = Uri.https(baseUrl, 'todos');
    final photosUri = Uri.https(baseUrl, 'photos');
    final albumsUri = Uri.https(baseUrl, 'albums');
    
    //setPost
    try {
      final res = await get(postUri);
      final postMap = json.decode(res.body);
      final postRef = db.ref('posts');
      await postRef.set(postMap);
      return true;
    } catch (e) {
      print('downloadAndUpload: error $e');
    }

    //setPost
    try {
      final res = await get(albumsUri);
      final albumMap = json.decode(res.body);
      final albumRef = db.ref('albums');
      await albumMap.set(albumMap);
      return true;
    } catch (e) {
      print('downloadAndUpload: error $e');
    }

    //setPhoto
    try {
      final res = await get(photosUri);
      final photoMap = json.decode(res.body);
      final photoRef = db.ref('photo');
      await photoMap.set(photoMap);
      return true;
    } catch (e) {
      print('downloadAndUpload: error $e');
    }

    //setTodo
    try {
      final res = await get(todosUri);
      final todoMap = json.decode(res.body);
      final todoRef = db.ref('todos');
      await todoRef.set(todoMap);
      return true;
    } catch (e) {
      print('downloadAndUpload: error $e');
    }

    //setUser
    try {
      final res = await get(userUri);
      final userMap = json.decode(res.body);
      final userRef = db.ref('users');
      await userRef.set(userMap);
      return true;
    } catch (e) {
      print('downloadAndUpload: error $e');
      return false;
    }
  }

  static Future<void> getUser(Function(User) onAdded) async {
    final ref = db.ref('users');

    ref.onChildAdded.listen((event) {
      print(
          "DBService:getPosts: data => ${event.snapshot.value}, eventType => ${event.type}");
      print('----------------------- ${event.snapshot.runtimeType}');
      if (event.snapshot.exists) {
        final user = User.fromJson(
          Map<String, dynamic>.from(
            event.snapshot.value as Map,
          ),
        );
        onAdded(user);
      }
    });
  }
}
