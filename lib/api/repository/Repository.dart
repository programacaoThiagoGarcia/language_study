import 'package:language_study/model/jsonDecoder/JsonDecoder.dart';
import 'package:language_study/api/connect/Connect.dart';
import 'dart:core';
import 'dart:async';


class Repository {
  static Future getUser<T extends JsonDecoderObject>(T t) async {
    var users = await ConnectManager().getData(URLSERVICE.USERS);
    var listUsers = [];
    for (Map item in users) {
      var user = t.objectFromJson(item);
      listUsers.add(user);
    }
    return listUsers;
  }

  static Future getPosts<T extends JsonDecoderObject>(T t) async {
    var posts = await ConnectManager().getData(URLSERVICE.POST);

    var listPost = [];
    for (Map item in posts) {
      var post = t.objectFromJson(item);
      listPost.add(post);
    }
    return listPost;
  }

  static Future postItem<T extends JsonDecoderObject>(T t) async {
    var body = t.objectToJson();
    var post = await ConnectManager().postData(body, URLSERVICE.POST);
    Map item = post;
    return t.objectFromJson(item);
  }

  static Future getClient<T extends JsonDecoderObject>(T t) async {
    var users = await ConnectManager().getClient(URLSERVICE.USERS);
    var listUsers = [];
    for (Map item in users) {
      var user = t.objectFromJson(item);
      listUsers.add(user);
    }
    return listUsers;
  }
}
