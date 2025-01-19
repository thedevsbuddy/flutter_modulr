import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController controller) {
        /// Show loading icon if busy
        if (controller.isBusy) return LoadingIconWidget(message: "Please wait...");

        return MasterLayout(
          title: "Dashboard",
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Get.toNamed(SettingsRoutes.settings),
            ),
          ],
          body: Padding(
            padding: EdgeInsets.all(0.0),
            child: Center(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Dashboard Page',
                      style: TextStyl.subtitle(context),
                    ),
                    SizedBox(height: kSpacer),
                    Text(
                      'Build something awesome',
                      style: TextStyl.body(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
