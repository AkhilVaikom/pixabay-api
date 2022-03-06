import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay/app/constants/my_material_color.dart';
import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/data/models/pixabay_model.dart';
import 'package:pixabay/app/modules/home/controllers/home_controller.dart';


final homeController= Get.find<HomeController>();
int currentPage = 1;

 Future<bool> getHitsData({bool isRefresh = false}) async {
    String searchValue = homeController.searchController.text;
    try {
      if (isRefresh) {
        currentPage = 1;
      }
      homeController.isFirstLoad(false);
      final Uri uri = Uri.parse(
          "$baseUrl?key=$apiKey&q=$searchValue&image_type=photo&pretty=true&page=$currentPage&per_page=10");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final result = PixaBayModelFromJson(response.body);
        if(result.total==0){
           Get.snackbar("No result found", "Try another",
          backgroundColor: myTeal, colorText: Colors.white);
        }
        homeController.hitsList = result.hits!;
        currentPage++;
        homeController.update();
        return true;
      } else {
        return false;
      }
    } finally {
      homeController.isFirstLoad(false);
    }
  }


