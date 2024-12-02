import 'dart:convert';
import 'package:flutter/services.dart';

class JsonDataSource {
  Future<Map<String, dynamic>> loadJson() async {
    final String jsonString = await rootBundle.loadString('assets/v1.json');
    return jsonDecode(jsonString);
  }
}
