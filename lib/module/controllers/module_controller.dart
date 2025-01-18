const String stub = """
import 'package:get/get.dart';

import '../../../shared/controllers/app_controller.dart';
// import '../services/{SNAKE_MODULE}_service.dart';

class {MODULE}Controller extends AppController {
  /// Create and get the instance of the controller
  static {MODULE}Controller get instance {
    if (!Get.isRegistered<{MODULE}Controller>()) Get.put({MODULE}Controller());
    return Get.find<{MODULE}Controller>();
  }

  /// Initialise [{MODULE}Module] service
  // final {MODULE}Service _{CAMEL_MODULE}Service = {MODULE}Service.instance;
  
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
