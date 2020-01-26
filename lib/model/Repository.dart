import 'package:language_study/model/JsonDecoder.dart'; 
import 'package:language_study/model/Connect.dart';
import 'dart:core';
import 'dart:async';


 class Repository  {
  
  Future getUser<T extends JsonDecoderObject>(T t) async {
    var users =  await ConnectManager().getData(URLSERVICE.USERS);
    var listUsers = [];
      for(Map item in users){
        var user =  t.objectFromJson(item);
        listUsers.add(user);
      }
    return listUsers;
  }

  Future getPosts<T extends JsonDecoderObject>(T t) async{
    var posts = await ConnectManager().getData(URLSERVICE.POST);
    var listPost = [];
      for (Map item in posts){
        var post = t.objectFromJson(item);
        listPost.add(post);
      }
    return listPost;
  }

  Future postItem<T extends JsonDecoderObject>(T t) async{
    var post = await ConnectManager().postData(t,URLSERVICE.POST);
    Map item = post;
    return t.objectFromJson(item);
  }
}