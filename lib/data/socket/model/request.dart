import 'dart:convert';

class Request {
  int id;
  String method;
  List<String> params;

  Request({required this.id, required this.method, required this.params});

  String toJson() {
    return jsonEncode({"id": id, "method": method, "params": params});
  }
}
