import 'package:flutter/material.dart';

import '../../../../helpers/helpers.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;

  AuthLayout({Key? key, required this.body, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySurface(context),
      body: body,
    );
  }
}
