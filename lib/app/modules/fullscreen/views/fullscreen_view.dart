import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixabay/app/constants/my_material_color.dart';

import '../controllers/fullscreen_controller.dart';

class FullscreenView extends GetView<FullscreenController> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Full Screen"),
        elevation: 0,
        backgroundColor: myTeal,
      ),
      body: Container(
        child: Image.network(
          controller.largeImageURL,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ), 
    );
  }
}
