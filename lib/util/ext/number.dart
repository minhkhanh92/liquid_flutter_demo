import 'package:intl/intl.dart';

extension doubleExt on double {
  String formatNumber({bool showSign = false, int? minimumFractionDigits}) {
    final format = showSign ? "+#,###.#;-#" : "#,###.#";
    final formatter = NumberFormat(format)
      ..minimumFractionDigits = minimumFractionDigits ?? 0;
    return formatter.format(this);
  }

  String formatPercent({bool showSign = false}) {
    return "${formatNumber(showSign: showSign, minimumFractionDigits: 1)}%";
  }
}
