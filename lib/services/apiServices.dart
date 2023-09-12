import 'dart:convert';

import 'package:quantum_task/utils/models/newsModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<NewsModal>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=keyword&apiKey=97663bfc33324f7d9b2b83e4741d2818'));

    if (response.statusCode == 200) {
      final List<dynamic> newsJson = json.decode(response.body)['articles'];

      final List<NewsModal> newsList = newsJson
          .map((json) => NewsModal.fromJson(json))
          .toList(); // Convert the JSON list to a list of NewsModal objects
      return newsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
