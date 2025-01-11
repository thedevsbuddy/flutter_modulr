const String stub = """
import 'package:flutter/material.dart';

import '../../../shared/views/layouts/master_layout.dart';

class {PAGE}Page extends StatelessWidget {
  const {PAGE}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "{PAGE}",
      body: SafeArea(
        child: Center(
          child: Text("Build awesome page here."),
        ),
      ),
    );
  }
}
""";
