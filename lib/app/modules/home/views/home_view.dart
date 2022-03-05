import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixabay/app/constants/string_constant.dart';
import 'package:pixabay/app/modules/home/widgets/search_button.dart';
import 'package:pixabay/app/modules/home/widgets/search_text_field.dart';
import 'package:pixabay/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: SearchTextField(controller: controller)),
            const SizedBox(
              width: 10,
            ),
            SearchButton(
              controller: controller,
            ),
          ],
        ),
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        //
      ),
      backgroundColor: AppColor.bgColor,
      body: GetBuilder(builder: (HomeController controller) {
        return controller.isFirstLoad.value
            ? const SizedBox.expand()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: controller.imageList.length,
                    // controller: _scrollController,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${controller.imageList[index].tags}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Card(
                                      child: Image.network(
                                        controller.imageList[index].previewUrl,
                                        
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    onTap: () {
                                      print(controller.imageList[index].largeImageUrl);
                                      Get.toNamed(Routes.FULLSCREEN, arguments: {
                                        'largeImageURL': controller.imageList[index].largeImageUrl,
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      }),
    );
  }
}
