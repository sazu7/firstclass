import 'package:myapps/pages/model/photos.dart';
import 'package:http/http.dart' as http;

class PhotosHelper {
  Future<List<Photos>?> getPhotos() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      print(response);
      if (response.statusCode == 200) {
        var json = response.body;
        return photosFromJson(json);
      }
    } catch (e) {
      print(e);
    }
  }
}
