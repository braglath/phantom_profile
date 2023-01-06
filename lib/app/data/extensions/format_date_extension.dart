import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String get formatDate {
    var outputFormat = DateFormat('MM/dd/yyyy');
    final formattedDate = outputFormat.format(this);
    return formattedDate;
  }
}
