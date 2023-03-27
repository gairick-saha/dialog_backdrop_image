import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: controller.selectedPageIndex,
        children: controller.allImages
            .map(
              (e) => Image.asset(
                e,
                fit: BoxFit.fill,
                scale: 1,
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(
              "Selected image: ${controller.allImages[controller.selectedPageIndex.value]}");

          Get.dialog(
            BackdropFilter(
              filter: ImageFilter.blur(),
              blendMode: BlendMode.srcOver,
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.2),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              controller.allImages[
                                  controller.selectedPageIndex.value],
                              fit: BoxFit.fill,
                              scale: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.yellow,
                              minWidth: double.maxFinite,
                              height: kMinInteractiveDimension,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text('Share current screen'),
                            ),
                            const SizedBox(height: 20.0),
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.yellow,
                              minWidth: double.maxFinite,
                              height: kMinInteractiveDimension,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text('Share full content'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            barrierColor: Colors.black.withOpacity(0.4),
          );
        },
        child: const Icon(
          Icons.share,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
