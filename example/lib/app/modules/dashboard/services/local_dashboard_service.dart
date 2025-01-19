import '../../../models/api_response.dart';
import '../../../shared/services/services.dart';
import 'dashboard_service.dart';

class LocalDashboardService extends BaseService implements DashboardService {
  @override
  String? database = 'dashboard';

  @override
  Future<ApiResponse> doSomething({required String client}) async {
    return ApiResponse(data: 'Local Data');
  }
}
