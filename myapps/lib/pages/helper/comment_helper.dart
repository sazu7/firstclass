import 'package:myapps/pages/model/comment.dart';
import 'package:http/http.dart' as http;

class CommentHelper {
  Future<List<Comment>?> getComments() async {
    try {
      var respons = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      print(respons);
      if (respons.statusCode == 200) {
        var json = respons.body;
        return commentFromJson(json);
      }
    } catch (e) {
      print(e);
    }
  }
}
