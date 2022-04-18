import 'package:intl/intl.dart';

extension StringX on String {
  String get ngn => '₦';
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/png/$this.png';
  String get capitalizeFirst => isNotEmpty && [0].isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1)}'
      : '';
  String get capitalize =>
      trim().split(' ').map((e) => e.capitalizeFirst).join(' ');

  String get formatMoney =>
      ngn + NumberFormat.currency(symbol: '').format(double.parse(this));

  String get formatDate =>
      '${DateFormat.d().format(DateTime.parse(this))}/${DateFormat.M().format(DateTime.parse(this))}/${DateFormat.y().format(DateTime.parse(this))}';

  String get formatTime => DateFormat.Hms().format(DateTime.parse(this));

  String get formatATime => DateFormat.jm().format(DateTime.parse(this));
}
