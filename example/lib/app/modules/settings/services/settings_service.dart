import 'package:get/get.dart';

import '../../../shared/shared.dart';
import 'api_settings_service.dart';
import 'local_settings_service.dart';

abstract class SettingsService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [SettingsService]
  static SettingsService get instance {
    if (!Get.isRegistered<SettingsService>())
      Get.lazyPut<SettingsService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalSettingsService();
        if (!internetService.isConnected) return LocalSettingsService();
        return ApiSettingsService();
      });
    return Get.find<SettingsService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}
