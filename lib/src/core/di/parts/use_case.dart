part of '../dependency_injection.dart';

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.read(authenticationRepositoryProvider));
}
