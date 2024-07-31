import 'dart:convert';

import 'package:feburary_flutter/screens/todo/model/todoResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../customUtility/APIConstant.dart';
import '../model/todoRequest.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  late Future<TodoResponse> futureToDoResponse;

  var getUserList = <DataItem>[].obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    doToList();
    super.onInit();
  }

  Future<void> doToList() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(APIConstant.url),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, HEAD"
        },
      );
      // final response = await http.get(Uri.parse('http://192.168.133.125:8089/api/v1/todolist/'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        TodoResponse todoResponse = TodoResponse.fromJson(jsonResponse);
        print("ToDoList: ${todoResponse.data}");
        getUserList.value = todoResponse.data;
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> addToDoList(DataItem item) async {
    try {
      isLoading(true);
      final response = await http.post(Uri.parse(APIConstant.url),
          headers: {
            "Access-Control-Allow-Origin": "*",
            // Required for CORS support to work
            // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          },

          //   headers: {
          // 'Content-Type': 'application/json'},
          body: jsonEncode(item.toJson()));

      if (response.statusCode == 201 || response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        TodoRequestResponse data = TodoRequestResponse.fromJson(jsonResponse);
        getUserList.add(data.data);
        Get.snackbar('SUCCESS', 'Todo Item added');
      } else {
        Get.snackbar('Error', 'Failed to add item');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred : $e');
    }
  }
}
