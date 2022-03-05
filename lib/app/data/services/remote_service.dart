import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay/app/constants/my_material_color.dart';
import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/data/models/pixabay_model.dart';

Future<List<PixaBayModel>> getImage(String text) async {
  var response = await http.get(
      Uri.parse("$baseUrl?key=$apiKey&q=$text&image_type=photo&pretty=true"));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
    final data = PixaBayModel.fromJson(jsonData);
    if (data.total == 0) {
      Get.snackbar("No result found", "Try another keyword",
          backgroundColor: myTeal, colorText: Colors.white);
    }
    return [data];
  } else {
    return [];
  }
}
