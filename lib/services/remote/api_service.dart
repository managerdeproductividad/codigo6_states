import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final apiServiceProvider = Provider<ApiService>((ref)=> ApiService());

class ApiService{
  Future<List> getPosts() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data;
    }
    return [];
  }

}