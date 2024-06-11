import 'package:get/get.dart';

class SelfServiceController extends SuperController{
  final list = <String>[].obs;

  @override
  void onInit() {
    loadList();
    super.onInit();
  }

  @override
  void onDetached() {
  }

  @override
  void onHidden() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }

  void loadList() {
    list.value = List<String>.generate(10, (i) {
      return "item $i";
    });
  }

}