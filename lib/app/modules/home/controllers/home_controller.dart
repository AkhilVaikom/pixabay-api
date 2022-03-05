import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay/app/data/services/remote_service.dart';

class HomeController extends GetxController {
  var searchValue = "";
  RxBool isLoading = false.obs;
  RxBool isFirstLoad = true.obs;
  var imageList = [].obs;
  late TextEditingController searchController;
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
  }

  fetchImage() async {
    searchValue = searchController.text;
    try {
      isFirstLoad(false);
      final _result = await getImage(searchValue);
      final _resultData = _result[0].hits;
      print(_resultData);
      if (_resultData != null) {
        imageList.clear();
        imageList.addAll(_resultData);
        print(imageList);
        update();
      }
      
    } finally {
      isLoading(false);
    }
  }
}
