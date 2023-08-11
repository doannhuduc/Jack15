import 'package:intl/intl.dart';

class Util {
  static String currency(num amount) {
    var format = NumberFormat('#,##0', 'ID').format(amount);
    return format;
  }
}
