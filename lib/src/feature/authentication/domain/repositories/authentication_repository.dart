import '../../../../core/base/repository.dart';
import '../entities/login_entity.dart';

abstract base class AuthenticationRepository extends Repository {
  Future<LoginResponseEntity> login(LoginRequestEntity entity);

  Future<String> forgotPassword(Map<String, dynamic> data);

  Future<String> resetPassword(Map<String, dynamic> data);

  Future<String> verifyOTP(Map<String, dynamic> data);

  Future<String> resendOTP(Map<String, dynamic> data);
}
