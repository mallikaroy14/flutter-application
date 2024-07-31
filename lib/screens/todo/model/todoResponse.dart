class TodoResponse {
  final List<DataItem> data;
  final String message;

  TodoResponse({required this.data, required this.message});

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<DataItem> dataItems = dataList.map((i) => DataItem.fromJson(i)).toList();

    return TodoResponse(
      data: dataItems,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
      'message': message,
    };
  }
}

class DataItem {
  final int? id;
  final String title;
  final String description;

  DataItem({ this.id, required this.title, required this.description});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'title': title,
      'description': description,
    };
  }
}
