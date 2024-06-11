import 'package:get/get.dart';

class DashboardController extends SuperController{

  final tabIndex = 0.obs;

  void changeTabIndex(index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onDetached() {
  }

  @override
  void onHidden() {
  }

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}