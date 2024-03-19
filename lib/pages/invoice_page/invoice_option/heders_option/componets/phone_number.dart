import 'package:invoice_genertor/pages/utills/headers.dart';

Widget phoneNumberRow() {
  return Container(
    margin: const EdgeInsets.all(7),
    child: TextFormField(
      onSaved: (val) {
        Globals.globals.phone = val;
      },
      validator: (val) {
        return val!.isEmpty
            ? "Must enter contact"
            : val.length < 10
                ? "Contact must be of 10 digits"
                : null;
      },
      textInputAction: TextInputAction.next,
      initialValue: Globals.globals.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 10,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        hintText: "Enter phone number",
        labelText: "phone number",
        hintStyle: const TextStyle(
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardType: TextInputType.phone,
    ),
  );
}
