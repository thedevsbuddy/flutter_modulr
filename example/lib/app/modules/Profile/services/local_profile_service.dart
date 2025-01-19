import '../../../shared/models/api_response.dart';
import '../../../shared/services/services.dart';
import 'profile_service.dart';

class LocalProfileService extends BaseService implements ProfileService {
  @override
  String? database = 'profile';

  @override
  Future<ApiResponse> getData() async {
    return ApiResponse(data: 'Local Data');
  }
}
