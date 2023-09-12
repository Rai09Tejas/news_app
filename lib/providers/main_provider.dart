import 'package:flutter/material.dart';
import 'package:quantum_task/services/apiServices.dart';
import 'package:quantum_task/utils/models/newsModel.dart';

class MainProvider extends ChangeNotifier {
  List<NewsModal> _newsList = [];
  List<NewsModal> get newsList => _newsList;

  ApiServices _newsApi = ApiServices();

  Future<void> getNews() async {
    _newsList = await _newsApi.fetchNews() ;
    notifyListeners(); // Notify consumers that the data has changed
  }
}
