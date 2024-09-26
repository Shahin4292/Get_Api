import 'dart:convert';

import 'package:get_api/model/get_model.dart';
import 'package:http/http.dart' as http;

class GetApiService {
  Future<List<CommentsModel>?> getCommentsModel() async {
    var data = http.Client();
    // var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (response.statusCode == 200) {
      var json = response.body;
      return commentsModelFromJson(json);
    }
    return null;
  }
}
