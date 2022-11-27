import 'dart:convert';
import 'package:database/models/album.dart';
import 'package:database/models/photo.dart';
import 'package:database/models/post.dart';
import 'package:http/http.dart';
import '../models/todo.dart';
import '../models/user.dart';

class Network {
  static String baseUrl = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  // Http endpoint

  static String apiUser = "users";
  static String apiPost = "posts";
  static String apiComment = "comments";
  static String apiTodos = "todos";
  static String apiPhoto = "posts";
  static String apiAlbum = "albums";

  // HTTP requests

  static Future<List<User>?> getUser(
      String api, Map<String, String>? params) async {
    final uri = Uri.https(baseUrl, api, params);
    final response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<User>((element) {
        return User.fromJson(element);
      }).toList();
    }
    return null;
  }

  static Future<List<Album>?> getAlbum(
      String api, Map<String, String>? params) async {
    final uri = Uri.https(baseUrl, api, params);
    final response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Album>((element) {
        return Album.fromJson(element);
      }).toList();
    }
    return null;
  }

  static Future<List<Todo>?> getTodo(
      String api, Map<String, String>? params) async {
    final uri = Uri.https(baseUrl, api, params);
    final response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Todo>((element) {
        return Todo.fromJson(element);
      }).toList();
    }
    return null;
  }

  static Future<List<Post>?> getPost(
      String api, Map<String, String>? params) async {
    final uri = Uri.https(baseUrl, api, params);
    final response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Post>((element) {
        return Post.fromJson(element);   
      }).toList();
    }
    return null;
  }

  static Future<List<Photo>?> getPhoto(
      String api, Map<String, String>? params) async {
    final uri = Uri.https(baseUrl, api, params);
    final response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Photo>((element) {
        return Photo.fromJson(element);
      }).toList();
    }
    return null;
  }


}
