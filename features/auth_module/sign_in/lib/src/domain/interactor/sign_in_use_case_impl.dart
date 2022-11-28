import 'package:core/core.dart';
import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_input.dart';
import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_output.dart';
import 'package:sign_in/src/domain/interactor/sign_in_use_case.dart';
import 'package:sign_in/src/domain/repositories/get_token_remote_repository.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final SignInRemoteRepository _signInRemoteRepository;
  final GetTokenRemoteRepository _getTokenRemoteRepository;
  final LocalStorageManager _localStorageManager;

  SignInUseCaseImpl({
    required SignInRemoteRepository signInRemoteRepository,
    required LocalStorageManager localStorageManager,
    required GetTokenRemoteRepository getTokenRemoteRepository,
  })  : _signInRemoteRepository = signInRemoteRepository,
        _getTokenRemoteRepository = getTokenRemoteRepository,
        _localStorageManager = localStorageManager;

  final List<String> _errors = [];
  late SignInUseCaseInput input;
  @override
  Future<SignInUseCaseOutput> execute(
    String username,
    String password,
  ) async {
    var token = await _getTokenRemoteRepository.getToken();

    if (token.hasErrors) {
      _errors.add('error');
      return SignInUseCaseOutput.withErrors(
        errors: _errors,
      );
    }

    input = SignInUseCaseInput(
      password: password,
      token: token.data!.token,
      userName: username,
    );

    var result = await _signInRemoteRepository.signIn(input);

    if (result.hasErrors) {
      _errors.add('error');
      return SignInUseCaseOutput.withErrors(
        errors: _errors,
      );
    }
    await _localStorageManager.saveStringData(
      'token',
      token.data!.token,
    );
    await _localStorageManager.saveStringData(
      'tokenExpireDate',
      token.data!.expiresAt,
    );

    return SignInUseCaseOutput.withData(
      data: result.data,
    );
  }
}
