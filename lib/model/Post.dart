import 'package:language_study/model/jsonDecoder/JsonDecoder.dart';
class Post extends JsonDecoderObject<Post>{
  String _userId;
  int _id;
  String _title;
  String _body;

  Post({String userId, int id, String title, String body}) {
    this._userId = userId;
    this._id = id;
    this._title = title;
    this._body = body;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get body => _body;
  set body(String body) => _body = body;

  Post.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'].toString();
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  @override
  Post objectFromJson(Map<String,dynamic > json) => Post.fromJson(json);
  
  @override
  Map<String, dynamic>objectToJson() => toJson();


  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['id'] = this._id != null?this._id : '0';
    data['title'] = this._title;
    data['body'] = this._body;
    return data;
  }
}