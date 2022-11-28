abstract class TokenDecoderManager {
  Future<Map<String, dynamic>> decodeToken(String token);

  Future<bool> tokenIsExpired(String? token);

  Future<DateTime> tokenExpirationDate(String token);

  Future<Duration> tokenTime(String token);
}
