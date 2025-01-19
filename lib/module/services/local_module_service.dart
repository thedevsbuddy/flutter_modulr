const String stub = """
import '../../../shared/shared.dart';
import '{SNAKE_MODULE}_service.dart';
 
class Local{MODULE}Service extends BaseService implements {MODULE}Service {
  @override
  String? database = '{SNAKE_MODULE}';

  @override
  Future<ApiResponse> doSomething({required String client}) async {
    throw UnimplementedError();
  }
}
""";
