import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl =
      'https://autometa-backend.onrender.com'; // Replace with your server IP

  static addStudent(Map sdata) async {
    final response = await http.post(Uri.parse("$baseUrl/api/addStudent"), body: sdata);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print("failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Add more API methods
}
