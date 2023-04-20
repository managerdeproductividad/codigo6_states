import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier{
  ApiService apiService = ApiService();

  List posts = [];

  bool isLoading = false;

  Future<List> getPosts() async{
    return await apiService.getPosts();
  }

  Future<void> getPosts2() async{
    isLoading = true;
    notifyListeners();
    posts = await apiService.getPosts();
    isLoading = false;
    notifyListeners();
  }

}