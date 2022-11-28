import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_input.dart';
import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_output.dart';

abstract class SignInRemoteRepository {
  Future<SignInUseCaseOutput> signIn(SignInUseCaseInput input);
}
