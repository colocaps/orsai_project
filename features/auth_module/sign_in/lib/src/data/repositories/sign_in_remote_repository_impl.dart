import 'package:core/core.dart';
import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_input.dart';
import 'package:sign_in/src/domain/interactor/input_output/sign_in_use_case_output.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';

class SignInRemoteRepositoryImpl implements SignInRemoteRepository {
  final String _baseUrl;
  final String _apiKey;
  final DioManager _dioManager;

  SignInRemoteRepositoryImpl({
    required String baseUrl,
    required String apiKey,
    required DioManager dioManager,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _dioManager = dioManager;

  static const String loginUrl =
      '/3/authentication/token/validate_with_login?api_key=';

  final List<String> _errors = [];
  @override
  Future<SignInUseCaseOutput> signIn(SignInUseCaseInput input) async {
    final url = getLoginUrl() + _apiKey;

    final response = await _dioManager.post(
      url,
      data: inputToJson(input),
    );
    if (response != null) {
      if (response.isOk()) {
        final signIn = _mapToTokenEntity(response.data);
        return SignInUseCaseOutput.withData(
          data: signIn,
        );
      } else {
        _errors.add('error');
        return SignInUseCaseOutput.withErrors(
          errors: _errors,
        );
      }
    } else {
      _errors.add('server error');
      return SignInUseCaseOutput.withErrors(
        errors: _errors,
      );
    }
  }

  static TokenEntity _mapToTokenEntity(Map<String, dynamic> json) {
    return TokenEntity(
      isSuccess: json['success'],
      expiresAt: json['expires_at'],
      token: json['request_token'],
    );
  }

  static Map<String, dynamic> inputToJson(SignInUseCaseInput input) {
    return {
      'username': input.userName,
      'password': input.password,
      'request_token': input.token,
    };
  }

  String getLoginUrl() => '$_baseUrl$loginUrl';
}
