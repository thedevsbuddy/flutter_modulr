import 'package:get/get.dart';

import '../../../shared/shared.dart';
import 'api_profile_service.dart';
import 'local_profile_service.dart';

abstract class ProfileService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [ProfileService]
  static ProfileService get instance {
    if (!Get.isRegistered<ProfileService>())
      Get.lazyPut<ProfileService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalProfileService();
        if (!internetService.isConnected) return LocalProfileService();
        return ApiProfileService();
      });
    return Get.find<ProfileService>();
  }

  /// Do Something
  Future<ApiResponse> getData();
}
