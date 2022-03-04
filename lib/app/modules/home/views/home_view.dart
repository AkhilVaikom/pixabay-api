import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/modules/home/widgets/search_button.dart';
import 'package:pixabay/app/modules/home/widgets/search_text_field.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Expanded(child: SearchTextField()),
            SizedBox(
              width: 10,
            ),
            SearchButton(),
          ],
        ),
        backgroundColor: AppColor.bgColor,
        elevation: 0,
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 25,
              // controller: _scrollController,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Flower",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Image.network(
                                "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_150.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
