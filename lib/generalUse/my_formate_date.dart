import 'package:intl/intl.dart';

String myFormateDateWithHour(DateTime? dateToFormate) {

  final formatter =  DateFormat('dd/MM/yyyy hh:mm:ss');
  final String formatted = formatter.format(dateToFormate!);

  return formatted;
}

String myFormateDateNoHour(DateTime? dateToFormate) {

  final formatter =  DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(dateToFormate!);

  return formatted;
}
