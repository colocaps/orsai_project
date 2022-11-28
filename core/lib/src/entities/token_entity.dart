class TokenEntity {
  final bool isSuccess;
  final String expiresAt;
  final String token;

  TokenEntity({
    required this.token,
    required this.isSuccess,
    required this.expiresAt,
  });
}

class PasswordValidator {
  static final _passwordRegex = RegExp(r'[0-9a-zA-Z]{4,}');

  passwordValidator(String value) => !_passwordRegex.hasMatch(value);
}
