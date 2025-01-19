import 'package:flutter_fusion/app/shared/services/auth_session/local_auth_session_service.dart';
import 'package:get/get.dart';

import '../../models/api_response.dart';
import '../services.dart';

abstract class AuthSessionService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [AuthSessionService]
  static AuthSessionService get instance {
    if (!Get.isRegistered<AuthSessionService>()) {
      Get.lazyPut<AuthSessionService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalAuthSessionService();
        if (!internetService.isConnected) return LocalAuthSessionService();
        return ApiAuthSessionService();
      });
    }
    return Get.find<AuthSessionService>();
  }

  /// Get and refresh user data
  Future<ApiResponse> getUser();

  /// Logout the user from system
  Future<ApiResponse> logout();
}
