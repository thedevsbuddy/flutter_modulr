import 'package:get/get.dart';

import '../../../shared/models/api_response.dart';
import '../../../shared/services/services.dart';
import 'api_dashboard_service.dart';
import 'local_dashboard_service.dart';

abstract class DashboardService extends BaseService {
  /// Define if this is in dev mode
  static const bool devMode = true;

  /// Create and get the instance of [DashboardService]
  static DashboardService get instance {
    if (!Get.isRegistered<DashboardService>())
      Get.lazyPut<DashboardService>(() {
        InternetService internetService = InternetService.instance;
        if (devMode) return LocalDashboardService();
        if (!internetService.isConnected) return LocalDashboardService();
        return ApiDashboardService();
      });
    return Get.find<DashboardService>();
  }

  /// Do Something
  Future<ApiResponse> getData({required String client});
}
