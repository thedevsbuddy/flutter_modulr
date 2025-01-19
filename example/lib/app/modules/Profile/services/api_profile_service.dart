import '../../../shared/models/api_response.dart';
import '../../../shared/services/services.dart';
import 'profile_service.dart';

class ApiProfileService extends BaseService implements ProfileService {
  @override
  Future<ApiResponse> getData() async {
    throw UnimplementedError('Add this method');
  }
}
