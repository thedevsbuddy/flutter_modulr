const String stub = """
import 'package:get/get.dart';

import '../../../shared/controllers/app_controller.dart';

class {CONTROLLER}Controller extends AppController {
  /// Create and get the instance of the controller
  static {CONTROLLER}Controller get instance {
    if (!Get.isRegistered<{CONTROLLER}Controller>()) Get.put({CONTROLLER}Controller());
    return Get.find<{CONTROLLER}Controller>();
  }
  
  /// Observables
  final RxBool _exampleBool = RxBool(false);

  /// Getters
  bool get exampleBool => _exampleBool.value;

  void exampleMethod() {
    // TODO: implement exampleMethod
    throw UnimplementedError();
  }
}
""";
