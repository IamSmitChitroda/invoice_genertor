import 'dart:ui';
import 'package:invoice_genertor/pages/invoice_page/invoice_option/heders_option/componets/sudmit_row.dart';
import 'package:invoice_genertor/pages/utills/headers.dart';

Widget formWidget({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name
                firstLastNameRow(),
                // Bill Number
                billNumber(),
                const SizedBox(
                  height: 20,
                ),
                // Submit
                submitRow(formKey: formKey, context: context),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
