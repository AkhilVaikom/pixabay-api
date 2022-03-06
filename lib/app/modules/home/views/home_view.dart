import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixabay/app/data/services/remote_service.dart';
import 'package:pixabay/app/modules/home/widgets/search_button.dart';
import 'package:pixabay/app/modules/home/widgets/search_text_field.dart';
import 'package:pixabay/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 182, 199, 119),
              Color.fromARGB(255, 58, 92, 136)
            ],
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                  child: SearchTextField(
                controller: controller,
                hintText: "Search",
              )),
              const SizedBox(
                width: 10,
              ),
              SearchButton(
                controller: controller,
                buttonName: "Search",
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          //
        ),
        backgroundColor: Colors.transparent,
        body: GetBuilder(builder: (HomeController controller) {
          return controller.isFirstLoad.value
              ? const SizedBox.expand()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    enablePullUp: true,
                    onRefresh: ()async{
                      final result=await getHitsData(isRefresh: true);
                      if(result){
                        controller.refreshController.refreshCompleted();
                      }else{
                        controller.refreshController.refreshFailed();
                      }
                    },
                    onLoading: ()async{
                       final result=await getHitsData();
                      if(result){
                        controller.refreshController.loadComplete();
                      }else{
                        controller.refreshController.loadFailed();
                      }
                    },
                    child: ListView.builder(
                        itemCount: controller.hitsList.length,
                        // controller: controller.scrollController,
                        itemBuilder: (context, index) {
                           final hitsListData=controller.hitsList[index];
                          return Card(
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${hitsListData.tags}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        child: Card(
                                          child: Image.network(
                                            "${hitsListData.previewUrl}",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        onTap: () {
                                          Get.toNamed(Routes.FULLSCREEN,
                                              arguments: {
                                                'largeImageURL': hitsListData.largeImageUrl,
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
                  ),
                );
        }),
      ),
    );
  }
}
