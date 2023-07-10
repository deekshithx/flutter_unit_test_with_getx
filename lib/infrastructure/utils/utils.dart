import 'package:intl/intl.dart';

class AppUtils {
  ///Converts epoch to string
  /// ```dart
  /// var output=formatEpoch(epoch:'165637382828')
  /// print(output); // 2021-12-31 19:30:00.000Z
  /// ```
  static String formatEpoch(
          {String? epoch, String dateFormat = 'dd MMM yyyy, HH:mm:ss'}) =>
      epoch != null
          ? DateFormat(dateFormat).format(DateTime.fromMicrosecondsSinceEpoch(
              int.parse(epoch) * 1000000,
            ))
          : '-';
  //Formates currenct by adding , and symbol
  static String formatCurrency(dynamic num, {bool showSymbol = false}) =>
      double.tryParse(num) != null
          ? NumberFormat.currency(
              name: "USD",
              locale: 'en_US',
              decimalDigits: 0,
              symbol: showSymbol ? '\$ ' : '',
            ).format(double.parse(num))
          : num;
}
