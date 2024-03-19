import 'package:invoice_genertor/pages/utills/headers.dart';

Widget billNumber() {
  return Container(
    margin: const EdgeInsets.all(7),
    child: TextFormField(
      onSaved: (val) {
        Globals.globals.billNumber = val;
      },
      validator: (val) {
        return val!.isEmpty ? "Must enter bill number" : null;
      },
      textInputAction: TextInputAction.next,
      initialValue: Globals.globals.billNumber,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.menu_book),
        hintText: "Enter bill number",
        labelText: "bill number",
        hintStyle: const TextStyle(
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}
