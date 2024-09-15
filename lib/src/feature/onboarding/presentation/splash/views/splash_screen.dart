import 'package:flutter/material.dart';

import '../../../../../core/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.logo.logo.svg(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
