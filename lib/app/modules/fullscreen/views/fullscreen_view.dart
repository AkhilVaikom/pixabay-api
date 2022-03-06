import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixabay/app/constants/my_material_color.dart';

import '../controllers/fullscreen_controller.dart';

class FullscreenView extends GetView<FullscreenController> {
  const FullscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Full Screen"),
        elevation: 0,
        backgroundColor: myTeal,
      ),
      body: SizedBox(
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
