import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/user_model.dart';
import '../../../shared/shared.dart';
import 'auth_service.dart';

class LocalAuthService extends BaseService implements AuthService {
  @override
  String? database = 'users';

  @override
  Future<ApiResponse> login(
      {required String client, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? _data = await db.findOne({
      'email': body['identifier'],
      'password': body['password'],
    });

    if (_data != null) {
      UserModel user = UserModel.fromJson(_data);
      return await 300.milliseconds.delay(
            () => ApiResponse.success(
              data: {
                'user': user.toJson(),
                'token': 'hdajkhasjhdajskdhkj',
              },
              message: 'Login Successful',
            ),
          );
    }

    return await 300
        .milliseconds
        .delay(() => ApiResponse.error(message: "Invalid Credentials"));
  }

  @override
  Future<ApiResponse> register(
      {required String client, required Map<String, dynamic> body}) async {
    List<Map<String, dynamic>>? users = await db.findMany();

    int newId = 1;
    if (users != null && users.isNotEmpty)
      newId = int.parse(users.last['id'].toString()) + 1;

    List<Map<String, dynamic>>? _data = await db.store(
      UserModel.fromJson(body)
          .copyWith(
            id: newId,
            avatar: "https://random.imagecdn.app/500/500",
          )
          .toJson(),
    );
    return await 300.milliseconds.delay(
          () => ApiResponse.success(data: _data),
        );
  }

  @override
  Future<ApiResponse> verifyOtp(
      {required String client, required Map<String, dynamic> body}) async {
    return await 300
        .milliseconds
        .delay(() => ApiResponse.success(message: "OTP Verified"));
  }
}
