import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/views/layouts/master_layout.dart';
import '../../../shared/views/widgets/loading_icon_widget.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return controller.isBusy
            ? LoadingIconWidget(message: "Please wait...")
            : MasterLayout(
                title: "Profile",
                body: SafeArea(
                  child: Center(
                    child: Text("Build awesome page here."),
                  ),
                ),
              );
      },
    );
  }
}
