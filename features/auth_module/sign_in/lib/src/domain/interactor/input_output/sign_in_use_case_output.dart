import 'package:sign_in/src/domain/entities/token_entity.dart';

class SignInUseCaseOutput {
  final TokenEntity? data;
  late List<String>? errors = [];

  SignInUseCaseOutput.withData({
    required this.data,
  });

  SignInUseCaseOutput.withErrors({
    required this.errors,
    this.data,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
