import 'package:http/http.dart' as http;
import 'package:rest_api_practice/models/comment.dart';
import 'package:rest_api_practice/models/post.dart';
import 'package:rest_api_practice/models/users.dart';

class RemoteService {
  var client = http.Client();
  Future<List<Post>?> getPosts() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Comment>?> getComment() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return commentFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Users>?> getUsers() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return usersFromJson(response.body);
    }
    return null;
  }
}
