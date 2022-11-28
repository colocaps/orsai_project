import 'package:core/core.dart';
import 'package:sign_in/src/domain/repositories/get_token_remote_repository.dart';
import 'package:sign_in/src/domain/repositories/get_token_remote_repository_output.dart';

class GetTokenRemoteRepositoryImpl implements GetTokenRemoteRepository {
  final String _baseUrl;
  final String _apiKey;
  final DioManager _dioManager;

  GetTokenRemoteRepositoryImpl({
    required String baseUrl,
    required String apiKey,
    required DioManager dioManager,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _dioManager = dioManager;

  static const String ahutorizeUrl = '/3/authentication/token/new?api_key=';

  final List<String> _errors = [];

  String authorizeUrl() => '$_baseUrl$ahutorizeUrl';

  @override
  Future<GetTokenRemoteRepositoryOutPut> getToken() async {
    final url = authorizeUrl() + _apiKey;

    final response = await _dioManager.get(
      url,
    );
    if (response != null) {
      if (response.isOk()) {
        final requestToken = _mapToTokenEntity(response.data);

        return GetTokenRemoteRepositoryOutPut(
          data: requestToken,
        );
      } else {
        _errors.add('error');
        return GetTokenRemoteRepositoryOutPut(
          errors: _errors,
        );
      }
    } else {
      _errors.add('server error');
      return GetTokenRemoteRepositoryOutPut(
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
}
