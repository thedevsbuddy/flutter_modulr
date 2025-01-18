const String stub = """
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../shared/services/services.dart';
import 'api_{SNAKE_MODULE}_service.dart';
import 'local_{SNAKE_MODULE}_service.dart';

abstract class {MODULE}Service extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [{MODULE}Service]
  static {MODULE}Service get instance {
    if (!Get.isRegistered<{MODULE}Service>()) Get.lazyPut<{MODULE}Service>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return Local{MODULE}Service();
        if (!internetService.isConnected) return Local{MODULE}Service();
        return Api{MODULE}Service();
      });
    return Get.find<{MODULE}Service>();
  }
  
  /// Do Something
  Future<ApiResponse> doSomething({required String client});
}
""";
