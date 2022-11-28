import 'package:core/src/abstractions/token_decoder_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenDecorManagerImpl implements TokenDecoderManager {
  @override
  Future<Map<String, dynamic>> decodeToken(String token) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken;
  }

  @override
  Future<DateTime> tokenExpirationDate(String token) async {
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);

    return expirationDate;
  }

  @override
  Future<bool> tokenIsExpired(String? token) async {
    if (token == "null") {
      return false;
    }

    return JwtDecoder.isExpired(token!);
  }

  @override
  Future<Duration> tokenTime(String token) async {
    Duration tokenTime = JwtDecoder.getTokenTime(token);
    return tokenTime;
  }
}
