class LoginRequestEntity {
  final String phone;
  final String otp;

  LoginRequestEntity({
    required this.phone,
    required this.otp,
  });
}

class LoginResponseEntity {
  final String accessToken;

  LoginResponseEntity({required this.accessToken});
}
