import '../../../models/models.dart';
import '../../../shared/services/services.dart';
import 'dashboard_service.dart';

class ApiDashboardService extends BaseService implements DashboardService {
  @override
  Future<ApiResponse> doSomething({required String client}) async {
    return await api.get('/url', client: client);
  }
}
