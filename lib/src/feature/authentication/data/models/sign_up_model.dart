import '../../domain/entities/sign_up_entity.dart';

class SignUpRequestModel extends SignUpRequestEntity {
  SignUpRequestModel({
    required super.firstName,
    required super.lastName,
    required super.role,
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "role": role,
      "email": email,
      "password": password,
    };
  }
}

class SignUpResponseModel extends SignUpResponseEntity {
  SignUpResponseModel({required super.accessToken});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      accessToken: json["access_token"],
    );
  }
}
