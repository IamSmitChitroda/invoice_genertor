import 'dart:developer';

import 'headers.dart';

class Globals {
  String? firstName, lastName, billNumber;

  Globals._();

  static final Globals globals = Globals._();

  void reset() {
    firstName = lastName = billNumber = null;
  }

  static List<TextEditingController> nameController = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> priceController = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> quentyController = [
    TextEditingController(),
    TextEditingController(),
  ];
  static int totalValue = 0;
  void Sum() {
    priceController.forEach(
      (element) {
        totalValue = int.parse(element.text) +
            int.parse(quentyController[priceController.indexOf(element)].text);
      },
    );
  }
}
