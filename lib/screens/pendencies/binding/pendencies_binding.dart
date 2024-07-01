import 'package:feburary_flutter/screens/pendencie_detail/controller/pendencies_details_controller.dart';
import 'package:get/get.dart';

import '../controller/pendencies_controller.dart';

class PendenciesBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(PendenciesDetailsController());
  }
}