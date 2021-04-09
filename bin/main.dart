import 'package:language_study/model/Post.dart';
import 'package:language_study/api/repository/Repository.dart';
import 'package:language_study/model/User.dart';

Future main(List<String> args) async {
  var flow = TEST.USER;

  switch (flow) {
    case TEST.USER:
      var users = await Repository.getUser(User()) as List;
      for (User user in users) {
        print(user.name);
        print('AND COMPANY NAME');
        print(user.company.name);
        print('');
      }
      break;
    case TEST.POSTS:
      var posts = await Repository.getPosts(Post()) as List;
      for (Post post in posts) {
        print(post.title);
      }
      break;
    case TEST.POST:
      var _post =
          Post(userId: '1', title: 'Cool', body: 'Flutter is very good');
      var post = await Repository.postItem(_post);
      print(post.body);
      break;
    default:
      var users = await Repository.getClient(User());

  }
}

enum TEST { USER, POSTS, POST, OTHER }


