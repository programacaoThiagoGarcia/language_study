import 'package:http/http.dart' as http;
import 'package:language_study/api/url/Urls.dart';
import 'dart:convert';

class Connect {
  Future getData(URLSERVICE type) async => null;

  Future postData(Map<String, String> body, URLSERVICE type) async => null;

  Future getClient(URLSERVICE type) async => null;
}

class ConnectManager implements Connect {
  String _baseUrl;

  ConnectManager() {
    _baseUrl = Urls.getBaseUrl(_EndPointService._getEndPoint());
  }

  //Método para realizar GET ao servidor
  @override
  Future getData(URLSERVICE type) async {
    var url = Uri.parse(_baseUrl + _EndPointService.getUrl(type));
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    print(json);
    return json;
  }

  /*
  Método para realizar POST ao servidor
  Recebendo na assinatura do método o body no formato Map<String,dynamic>
   */

  @override
  Future postData(Map<String, dynamic> body, URLSERVICE type) async {
    var url = Uri.parse(_baseUrl + _EndPointService.getUrl(type));
    var response = await http.post(url, body: body);
    var json = jsonDecode(response.body);
    return json;
  }

  /*
  Método para realizar GET ao servidor utilizando o objeto Client e após o request temos um client.Close()
   */
  @override
  Future getClient(URLSERVICE type) async {
    var url = Uri.parse(_baseUrl + _EndPointService.getUrl(type));
    var client = http.Client();
    try {
      var response = await client.get(url);
      var json = jsonDecode(response.body);
      print('RESPONSE');
      print(json);
      return json;
    } finally {
      print('CLOSE');
      client.close();
    }
  }
}

/*
*  Classe que define os serviços que serão chamados pelo ConnectManager
* */
enum URLSERVICE { USERS, POST } // Enum que define qual serviço será usado

class _EndPointService {
  static String getUrl(URLSERVICE type) {
    switch (type) {
      case URLSERVICE.USERS:
        return '/users';
        break;
      case URLSERVICE.POST:
        return '/posts';
        break;
    }
    return null;
  }

  /*
  Define o amiente que estamos trabalhando, utilizando o TARGET
   */
  static TARGET _getEndPoint() {
    return TARGET.PROD;
  }
}
