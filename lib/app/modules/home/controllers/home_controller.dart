import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pixabay/app/constants/my_material_color.dart';
import 'package:pixabay/app/data/models/pixabay_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  var searchValue = "";
  int currentPage = 1;
  RxBool isFirstLoad = true.obs;
  List hitsList = <Hit>[].obs;
  late TextEditingController searchController;
  ScrollController scrollController = ScrollController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    scrollController.dispose();
  }

  Future<bool> getHitsData({bool isRefresh = false}) async {
    searchValue = searchController.text;
    try {
      if (isRefresh) {
        currentPage = 1;
      }
      isFirstLoad(false);
      final Uri uri = Uri.parse(
          "https://pixabay.com/api/?key=25971996-21a64246427833fbe87345d74&q=$searchValue&image_type=photo&pretty=true&page=$currentPage&per_page=10");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final result = PixaBayModelFromJson(response.body);
        if(result.total==0){
           Get.snackbar("No result found", "Try another",
          backgroundColor: myTeal, colorText: Colors.white);
        }
        hitsList = result.hits!;
        currentPage++;
        update();
        return true;
      } else {
        return false;
      }
    } finally {
      isFirstLoad(false);
    }
  }
}
