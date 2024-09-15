import '../../domain/entities/login_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({required super.accessToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json["access_token"],
    );
  }
}
