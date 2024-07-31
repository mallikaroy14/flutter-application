// class DataItem {
//   final int id;
//   final String title;
//   final String description;
//
//   DataItem({required this.id, required this.title, required this.description});
//
//   factory DataItem.fromJson(Map<String, dynamic> json) {
//     return DataItem(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//     };
//   }
// }

import 'package:feburary_flutter/screens/todo/model/todoResponse.dart';

class TodoRequestResponse {
  final DataItem data;
  final String message;

  TodoRequestResponse({required this.data, required this.message});

  factory TodoRequestResponse.fromJson(Map<String, dynamic> json) {
    return TodoRequestResponse(
      data: DataItem.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'message': message,
    };
  }
}
