part of '../views/login_screen.dart';

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.otpController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController otpController;

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
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: widget.phoneController,
            decoration: const InputDecoration(hintText: "+880-X-XXXXXXX"),
            onChanged: (value) {
              Log.info("Phone number: $value");
            },
          ),
          if (state is AsyncData) ...[
            const SizedBox(height: 16),
            const Text(
              "OTP",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: widget.otpController,
              decoration: const InputDecoration(
                hintText: "XXXX",
              ),
              onChanged: (value) {
                Log.info("OTP: $value");
              },
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: "Didn't receive OTP? ",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                children: [
                  TextSpan(
                    text: "Resend",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
