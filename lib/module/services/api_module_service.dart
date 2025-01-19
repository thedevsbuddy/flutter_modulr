const String stub = """
import '../../../shared/shared.dart';
import '{SNAKE_MODULE}_service.dart';

class Api{MODULE}Service extends BaseService implements {MODULE}Service {  
  @override
  Future<ApiResponse> doSomething({required String client}) async {
    throw UnimplementedError();
  }
}
""";
