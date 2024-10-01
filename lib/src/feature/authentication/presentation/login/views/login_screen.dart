import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nagorik_mobile/src/core/services/navigation/routes.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../domain/entities/login_entity.dart';
import '../riverpod/login_provider.dart';

part '../widgets/login_form.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final notifier = ref.watch(loginProvider.notifier);

    ref.listen(loginProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 64),
                  _LoginForm(formKey: formKey),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                if (!state.hasError && (state.hasValue && state.value != null)) {
                  context.go(Routes.main);
                } else {
                  notifier.loginMock(
                    LoginRequestEntity(
                      email: 'user',
                      password: 'password',
                    ),
                  );
                }
              },
              child: state.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : !state.hasError && (state.hasValue && state.value != null)
                      ? const Text("Continue")
                      : const Text("Send OTP"),
            )
          ],
        ),
      ),
    );
  }
}
