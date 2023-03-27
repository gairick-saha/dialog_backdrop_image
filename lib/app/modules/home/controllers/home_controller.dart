import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> allImages = <String>[
    'assets/img.jpg',
    'assets/img2.webp',
  ];

  final RxInt selectedPageIndex = RxInt(0);

  @override
  void onInit() {
    selectedPageIndex(allImages.indexOf(allImages.first));
    super.onInit();
  }
}
