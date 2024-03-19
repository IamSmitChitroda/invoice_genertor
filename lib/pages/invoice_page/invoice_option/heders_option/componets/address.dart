import 'package:invoice_genertor/pages/utills/headers.dart';

Widget addressRow({required GlobalKey<FormState> formKey}) {
  return Container(
    margin: const EdgeInsets.all(7),
    child: TextFormField(
      initialValue: Globals.globals.address,
      onSaved: (val) {
        Globals.globals.address = val;
      },
      validator: (val) => val!.isEmpty ? "Must enter address" : null,
      onFieldSubmitted: (val) {
        formKey.currentState!.validate();
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_on_sharp),
        hintText: "Enter address",
        labelText: "address",
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
