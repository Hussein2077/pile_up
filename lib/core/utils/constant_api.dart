class ConstantApi {
  static const String baseUrl =
      '';

  static const String login = "${baseUrl}login";
  static const String myData = "${baseUrl}my-data";
  static const String email = "email";
  static const String signUp = "sign-up";
  static const String sendCode = "${baseUrl}Auth/generate-otp";
  static const String verifyCode = "${baseUrl}Auth/validate-otp";
  static const String resetPassword  = "${baseUrl}Auth/reset-password-with-otp";
  static const String changePassword  = "${baseUrl}Auth/Change-password";
  static const String password = "password";
}
