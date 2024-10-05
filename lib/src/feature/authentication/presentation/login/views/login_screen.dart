import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagorik_mobile/src/core/logging/logger/log.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../riverpod/login_provider.dart';

part '../widgets/login_form.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final notifier = ref.watch(loginProvider.notifier);

    ref.listen(loginProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        // Handle error here, however you want
      } else if (next.hasValue) {
        // Handle success here, however you want
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 80),
                  Assets.logo.logo.svg(height: 72, width: 72),
                  const SizedBox(height: 8),
                  const Text(
                    "Enter phone number to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 64),
                  _LoginForm(
                    formKey: formKey,
                    phoneController: phoneController,
                    otpController: otpController,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  notifier.login();
                }
              },
              child: state.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : state.hasValue && !state.hasError
                      ? const Text("Continue")
                      : const Text("Send OTP"),
            )
          ],
        ),
      ),
    );
  }
}
