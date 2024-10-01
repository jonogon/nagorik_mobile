part of '../views/login_screen.dart';

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  ConsumerState<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phone Number",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              hintText: "+880-X-XXXXXXX",
            ),
          ),
          if (!state.hasError && (state.hasValue && state.value != null)) ...[
            const SizedBox(height: 16),
            const Text(
              "OTP",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            const TextField(
              decoration: InputDecoration(
                hintText: "XXXX",
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Didn't receive OTP? Resend",
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
