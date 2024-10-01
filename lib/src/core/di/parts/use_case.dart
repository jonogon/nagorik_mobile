part of '../dependency_injection.dart';

@riverpod
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
  return RegisterUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.read(authenticationRepositoryProvider));
}
