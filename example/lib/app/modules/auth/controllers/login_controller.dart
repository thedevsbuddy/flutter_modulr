import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class LoginController extends AppController {
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  final AuthService _authService = AuthService.instance;

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    await attempt();
  }

  Future<void> attempt() async {
    String client = "loginAttempt";

    try {
      /// Prepare form data to be sent to server
      Map<String, dynamic> body = {
        "identifier": identifierInput.text,
        "password": passwordInput.text,
      };

      /// Initialize the Service and request server
      _authService.init(client);

      /// Call api to login user
      ApiResponse response =
          await _authService.login(client: client, body: body);
      // log.w(response.data);
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        _authService.close(client);
        return;
      }
      await auth.setUserData(response.data['user']);
      await auth.setUserToken(response.data['token']);
      Toastr.show(message: "${response.message}");

      /// Close the Service and request server
      _authService.close(client);

      /// Redirect user
      Get.offAllNamed(DashboardRoutes.dashboard);
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: e.toString()));
    }
  }
}
