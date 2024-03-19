import 'headers.dart';

class Globals {
  String? firstName, lastName, phone, address, billNumber;

  Globals._();

  static final Globals globals = Globals._();

  void reset() {
    firstName = lastName = phone = address = billNumber = null;
  }

  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
  ];
}
