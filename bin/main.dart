import 'package:language_study/model/Post.dart';
import 'package:language_study/model/Repository.dart';
import 'package:language_study/model/User.dart';



Future main(List<String> args) async {

var flow  = TEST.OTHER;

var operacoes = Operacao();
print(operacoes.soma(1, 2));
print(operacoes.subtracao(3, 2));

switch (flow) {
  case TEST.USER:
  var users = await Repository().getUser(User()) as List;
  for(User user in users){
    print(user.name);
    print('AND COMPANY NAME');
    print(user.company.name);
    print('');
  }  
    break;
    case TEST.POSTS:
    var posts = await Repository().getPosts(Post()) as List;
    for(Post post in posts){
      print(post.title);
    }
  break;
case TEST.POST:
var _post = Post(userId: '1',title: 'Cool',body: 'Flutter is very good');
  var post = await Repository().postItem(_post);
  print(post.body);
  break;
  default:
  
}

}


enum TEST{USER, POSTS, POST, OTHER}

class Operacao{
  int soma(int num_1, int num_2) => num_1 + num_2;
}

extension OutraOperacao on Operacao{
  int subtracao(int num_1, int num_2) => num_1 - num_2;
}