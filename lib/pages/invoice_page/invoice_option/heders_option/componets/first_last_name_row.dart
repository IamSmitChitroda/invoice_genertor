import 'package:invoice_genertor/pages/utills/headers.dart';

Widget firstLastNameRow() {
  return Row(
    children: [
      // FirstName
      Expanded(
        child: Container(
          margin: const EdgeInsets.all(7),
          child: TextFormField(
            onSaved: (val) {
              Globals.globals.firstName = val;
            },
            validator: (val) {
              if (val!.isEmpty) {
                return "Must enter first name";
              } else {
                return null;
              }
            },
            initialValue: Globals.globals.firstName,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Enter first name",
              labelText: "First Name",
              hintStyle: const TextStyle(
                color: Colors.black45,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      // LastName
      Expanded(
        child: Container(
          margin: const EdgeInsets.all(7),
          child: TextFormField(
            //1
            onSaved: (val) {
              Globals.globals.lastName = val;
            },

            validator: (val) {
              if (val!.isEmpty) {
                return "Must enter last name";
              } else {
                return null;
              }
            },
            initialValue: Globals.globals.lastName,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "Enter last name",
              labelText: "Last Name",
              hintStyle: const TextStyle(
                color: Colors.black45,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
