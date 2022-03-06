import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay/app/data/models/pixabay_model.dart';
import 'package:pixabay/app/data/services/remote_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  var searchValue = "";
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
}
