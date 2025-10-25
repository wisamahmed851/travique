import 'package:get/get.dart';

class LayoutController extends GetxController {
  var selectedIndex = 0.obs;

  void onChangeTab(int index){
    selectedIndex.value = index;
  }
}
