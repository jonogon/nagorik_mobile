import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/services/navigation/route_configuration.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.5,
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF172B24),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0xFF172B24),
              onSecondary: Color(0xFFFFFFFF),
              onSecondaryContainer: Color(0xFFC4CAC8),
            ),
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: Color(0xFFFFFFFF),
            ),
            filledButtonTheme: const FilledButtonThemeData(
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                minimumSize: WidgetStatePropertyAll(
                  Size(double.infinity, 48),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade500,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFC4CAC8),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFC4CAC8),
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  // color: color.disabledBorder,
                  width: 1,
                ),
              ),
              // suffixIconColor: color.suffixIcon,
            )),
        routerConfig: ref.read(routerProvider),
      ),
    );
  }
}
