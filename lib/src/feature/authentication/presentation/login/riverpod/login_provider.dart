import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/repositories/authentication_repository.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  late AuthenticationRepository _repository;

  @override
  FutureOr<LoginResponseEntity?> build() async {
    _repository = ref.read(authenticationRepositoryProvider);
    return null;
  }

  Future<void> login() async {
    state = const AsyncValue.loading();

    final entity = LoginRequestEntity(phone: '01987527259', otp: '1234');

    state = await AsyncValue.guard(() async {
      final result = await _repository.login(entity);

      return result;
    });
  }
}
