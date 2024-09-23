import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../domain/entities/login_entity.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<LoginEntity?> build() async {
    return null;
  }

  Future<void> login(LoginRequestEntity request) async {
    final loginUseCase = ref.read(loginUseCaseProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final result = await loginUseCase.call(request);

      return result;
    });
  }

  Future<void> loginMock(LoginRequestEntity request) async {
    state = const AsyncValue.loading();

    await Future.delayed(const Duration(seconds: 2));

    state = await AsyncValue.guard(() async {
      if (Random().nextBool()) {
        return LoginEntity();
      } else {
        throw Exception('Login failed');
      }
    });
  }
}
