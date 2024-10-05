import '../../../../core/base/use_case.dart';
import '../entities/login_entity.dart';
import '../repositories/authentication_repository.dart';

final class LoginUseCase
    extends UseCase<LoginResponseEntity, LoginRequestEntity> {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<LoginResponseEntity> call(LoginRequestEntity request) async {
    return repository.login(request);
  }
}
