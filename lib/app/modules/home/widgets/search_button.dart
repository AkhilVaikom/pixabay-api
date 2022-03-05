import 'package:flutter/material.dart';

import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/modules/home/controllers/home_controller.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColor.buttonColor,
        onPrimary: Colors.white,
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(80, 40),
      ),
      onPressed: () {
        controller.fetchImage();
      },
      child: const Text('Search'),
    );
  }
}
