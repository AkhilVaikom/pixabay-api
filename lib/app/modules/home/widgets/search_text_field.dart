import 'package:flutter/material.dart';

import 'package:pixabay/app/constants/my_material_color.dart';
import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/modules/home/controllers/home_controller.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  final HomeController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchController,
      style: const TextStyle(fontSize: 16, color: AppColor.fontColor),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        border: textBorder(),
        enabledBorder: textBorder(),
        focusedBorder: textBorder(),
      ),
    );
  }

  OutlineInputBorder textBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: myTeal, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    );
  }
}
