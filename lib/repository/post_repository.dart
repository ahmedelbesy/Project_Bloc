import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_bloc/model/model_post_data.dart';

class PostRepository {
  // ignore: missing_return
  Future<List<Post_data>> fetchPosts() async {
    List<Post_data> posts = [];
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data.map((post) => posts.add(Post_data.fromJson(post))).toList();

      return posts;
    }
  }
}
