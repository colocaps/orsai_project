class SignInUseCaseInput {
  final String userName;
  final String password;
  final String token;

  SignInUseCaseInput({
    required this.token,
    required this.userName,
    required this.password,
  });
}
