const String stub = """
import '../../../models/api_response.dart';
import '../../../shared/services/services.dart';
import 'package:get/get.dart';

import 'api_{SNAKE_MODULE}_service.dart';
import 'local_{SNAKE_MODULE}_service.dart';

abstract class {MODULE}Service extends BaseService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const mockEnabled = true;

  /// Create and get the instance of [{MODULE}Service]
  static {MODULE}Service get instance {
    if (!Get.isRegistered<{MODULE}Service>()) Get.lazyPut<{MODULE}Service>(() => mockEnabled ? Local{MODULE}Service() : Api{MODULE}Service());
    return Get.find<{MODULE}Service>();
  }
  
  /// Do Something
  Future<ApiResponse> doSomething();
}
""";
