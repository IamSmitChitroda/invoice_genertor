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
  void calculateTotalValue() {
    for (var element in priceController) {
      totalValue += int.parse(element.text.isNotEmpty ? element.text : "0") *
          int.parse(
              quentyController[priceController.indexOf(element)].text.isNotEmpty
                  ? quentyController[priceController.indexOf(element)].text
                  : "0");
    }
  }
}
