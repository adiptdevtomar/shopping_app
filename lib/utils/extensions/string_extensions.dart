import 'package:intl/intl.dart';

import '';

extension StringExtensions on double? {
  String formatPrice() {
    const int maxDecimalCount = 2;
    final String decimals = toString().split('.')[1];
    int actualDecimalLength;
    if (decimals == '00' || decimals == '0') {
      actualDecimalLength = 0;
    } else if (decimals.length <= maxDecimalCount) {
      actualDecimalLength = maxDecimalCount;
    } else {
      actualDecimalLength = maxDecimalCount;
    }
    return NumberFormat.simpleCurrency(
      locale: 'HI',
      decimalDigits: actualDecimalLength,
    ).format(this);
  }
}
