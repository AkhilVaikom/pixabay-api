import 'package:flutter/material.dart';
import 'package:pixabay/app/constants/my_material_color.dart';
import 'package:pixabay/app/constants/string_constant.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 16, color: AppColor.fontColor),
      decoration: const InputDecoration(
        hintText: "Search",
        contentPadding:
            EdgeInsets.symmetric(horizontal: 25),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: myTeal, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: myTeal, width: 2),
            borderRadius:
                BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: myTeal, width: 2),
            borderRadius:
                BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
