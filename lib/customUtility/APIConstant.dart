import 'dart:io';

class APIConstant{

  static const url = 'http://192.168.133.125:8089/api/v1/todolist/';

  static Map<String, String> authHeader  = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

}