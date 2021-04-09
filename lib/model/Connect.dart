import 'package:http/http.dart' as http;
import 'package:language_study/model/JsonDecoder.dart';
import 'dart:convert';



class Connect{
  Future getData(URLSERVICE type) async => null;
  Future postData<T extends JsonDecoderObject>(T t,URLSERVICE type) async => null;
}

class ConnectManager implements Connect{
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future getData(URLSERVICE type) async {
    var url = Uri.parse(_baseUrl + EndPointService.getUrl(type));
    
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    print(json);
      return json;
  }

  @override
  Future postData<T extends JsonDecoderObject>(T t,URLSERVICE type) async{
    var url = Uri.parse(_baseUrl + EndPointService.getUrl(type));
    var response = await http.post(url, body: t.objectToJson());
    var json = jsonDecode(response.body);
    return json;
  }
}


class EndPointService {
static String getUrl(URLSERVICE type){
  switch(type){
    case URLSERVICE.USERS:
      return '/users';
      break;
    case URLSERVICE.POST:
      return '/posts';
      break;
  }
  return null;
}
}


enum URLSERVICE
{
  USERS,
  POST
  }