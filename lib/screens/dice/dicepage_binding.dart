
import 'package:get/get.dart';

import 'dice_controller.dart';

class DicePageBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(DicePageController());
  }
}