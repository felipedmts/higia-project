import 'package:uuid/uuid.dart';

var uuid = Uuid();

String myGenerateUUID() {
  var id = uuid.v4();
  return id;
}
