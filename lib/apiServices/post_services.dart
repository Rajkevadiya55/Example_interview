import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService {
  Future getResponse(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? header}) async {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: header,
    );
    print("Url::::::$url");
    print("Body::::::$body");
    print("Header::::${header.toString()}");
    return jsonDecode(response.body);
  }
}
