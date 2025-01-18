const String stub = """
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/views/layouts/master_layout.dart';
import '../../../shared/views/widgets/widgets.dart';
import '../controllers/{SNAKE_MODULE}_controller.dart';

class {MODULE}Page extends StatelessWidget {
  const {MODULE}Page({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<{MODULE}Controller>(
      init: {MODULE}Controller(),
      builder: ({MODULE}Controller controller) {
        return controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "{MODULE}",
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
""";
