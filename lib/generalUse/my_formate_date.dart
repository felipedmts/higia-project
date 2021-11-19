import 'package:intl/intl.dart';

String myFormateDate(DateTime? dateToFormate) {

  final formatter =  DateFormat('dd-MM-yyyy hh:mm:ss');
  final String formatted = formatter.format(dateToFormate!);

  return formatted;
}
