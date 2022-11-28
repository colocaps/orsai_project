abstract class DateFormatHelper {
  DateTime parse(String s, {String format = ''});

  DateTime parseStringToDateTime(String s);

  String toDateString(DateTime dateTime);

  String toFullDateString(DateTime dateTime);

  String toFormat(DateTime dateTime, String format);
}
