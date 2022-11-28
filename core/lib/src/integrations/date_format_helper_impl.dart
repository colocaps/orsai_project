import 'package:core/src/abstractions/date_format_helper.dart';
import 'package:intl/intl.dart';

class DateFormatHelperImpl implements DateFormatHelper {
  @override
  DateTime parse(String s, {String format = ''}) {
    if (format.isNotEmpty) {
      return DateFormat(format).parse(s);
    }
    return DateFormat('dd/MM/yyyy').parse(s);
  }

  @override
  String toDateString(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  String toFormat(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  @override
  String toFullDateString(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
  }

  @override
  DateTime parseStringToDateTime(String s) {
    if (s.isNotEmpty || s != "") {
      return DateTime.parse(s);
    }
    return DateTime(0);
  }
}
