import 'package:invoice_genertor/pages/utills/headers.dart';

Widget submitRow({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: () {
          bool validated = formKey.currentState!.validate();

          if (validated) {
            // Save data of entire form
            formKey.currentState!.save();
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                validated ? "Form saved" : "Failed to validate the form",
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: validated ? Colors.green : Colors.red,
            ),
          );
        },
        child: const Text("SAVE"),
      ),
      ElevatedButton(
        onPressed: () {
          Globals.globals.reset();
          formKey.currentState!.reset();
        },
        child: const Text("RESET"),
      ),
    ],
  );
}
