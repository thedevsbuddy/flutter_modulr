import '../../../shared/shared.dart';
import 'dashboard_service.dart';

class ApiDashboardService extends BaseService implements DashboardService {
  @override
  Future<ApiResponse> getData({required String client}) async {
    return await api.get('/url', client: client);
  }
}
