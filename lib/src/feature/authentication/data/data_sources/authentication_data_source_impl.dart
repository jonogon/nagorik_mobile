part of 'authentication_data_source.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl({required this.remote});

  final RestClientKit remote;

  @override
  Future<Response> login(Map<String, dynamic> data) async {
    return remote.post(Endpoints.login, data: data);
  }

  @override
  Future<Response> register(Map<String, dynamic> data) async {
    return remote.post(Endpoints.register, data: data);
  }

  @override
  Future<Response> forgotPassword(Map<String, dynamic> data) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Response> resendOTP(Map<String, dynamic> data) {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<Response> resetPassword(Map<String, dynamic> data) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Response> verifyOTP(Map<String, dynamic> data) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
