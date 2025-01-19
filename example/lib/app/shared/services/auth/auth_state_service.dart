import 'package:flutter_fusion/app/shared/services/auth/local_auth_state_service.dart';
import 'package:get/get.dart';

import '../../models/api_response.dart';
import '../services.dart';

abstract class AuthStateService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [AuthStateService]
  static AuthStateService get instance {
    if (!Get.isRegistered<AuthStateService>())
      Get.lazyPut<AuthStateService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalAuthStateService();
        if (!internetService.isConnected) return LocalAuthStateService();
        return ApiAuthStateService();
      });
    return Get.find<AuthStateService>();
  }

  /// Get and refresh user data
  Future<ApiResponse> getUser();

  /// Logout the user from system
  Future<ApiResponse> logout();
}
