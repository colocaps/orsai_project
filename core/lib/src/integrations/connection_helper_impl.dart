import 'dart:io';

import 'package:core/src/abstractions/connection_helper.dart';

class ConnectionHelperImpl implements ConnectionHelper {
  @override
  Future<bool> isConnected() async {
    var connect = false;

    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }

    return connect;
  }
}
