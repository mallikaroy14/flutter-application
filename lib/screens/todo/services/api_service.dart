import 'dart:convert';

import 'package:feburary_flutter/screens/todo/model/todoResponse.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<TodoResponse> fetchToDoList() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      print("response: $response");
      final jsonResponse = jsonDecode(response.body);
      return TodoResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load to-do list');
    }
  }
}
