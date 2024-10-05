import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_sources/authentication_data_source.dart';
import '../models/login_model.dart';

final class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource remote;

  AuthenticationRepositoryImpl({required this.remote});

  @override
  Future<LoginResponseEntity> login(LoginRequestEntity entity) async {
    return await request(() async {
      final response = await remote.login(entity.toJson());
      return LoginResponseModel.fromJson(response.data);
    });
  }

  @override
  Future<String> forgotPassword(Map<String, dynamic> data) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(Map<String, dynamic> data) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> verifyOTP(Map<String, dynamic> data) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }

  @override
  Future<String> resendOTP(Map<String, dynamic> data) {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }
}
