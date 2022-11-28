import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_output.dart';

abstract class SignInUseCase {
  Future<SignInUseCaseOutput> execute(
    String username,
    String password,
  );
}
