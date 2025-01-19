import 'package:get/get.dart';

import '../../../shared/shared.dart';
import 'api_auth_service.dart';
import 'local_auth_service.dart';

abstract class AuthService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [AuthService]
  static AuthService get instance {
    if (!Get.isRegistered<AuthService>())
      Get.lazyPut<AuthService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalAuthService();
        if (!internetService.isConnected) return LocalAuthService();
        return ApiAuthService();
      });
    return Get.find<AuthService>();
  }

  /// Login the user
  Future<ApiResponse> login(
      {required String client, required Map<String, dynamic> body});

  /// Registers user
  Future<ApiResponse> register(
      {required String client, required Map<String, dynamic> body});

  /// Verifies OTP
  Future<ApiResponse> verifyOtp(
      {required String client, required Map<String, dynamic> body});
}
