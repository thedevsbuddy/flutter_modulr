const String stub = """
import '../../../models/api_response.dart';
import '../../../shared/services/services.dart';
import '{SNAKE_MODULE}_service.dart';
 
class Local{MODULE}Service extends BaseService implements {MODULE}Service {
  @override
  Future<ApiResponse> doSomething() async {
    throw UnimplementedError();
  }
}
""";
