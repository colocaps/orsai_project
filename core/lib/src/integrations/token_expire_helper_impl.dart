import 'package:core/src/abstractions/token_expire_helper.dart';

class TokenExpireHelperImpl implements TokenExpireHelper {
  @override
  Future<DateTime> expiresAt(String date) async {
    String result = date.replaceAll(RegExp('[UTC]'), '');
    DateTime expirationDate = DateTime.parse(result.trim()).toLocal();
    return expirationDate;
  }
}
