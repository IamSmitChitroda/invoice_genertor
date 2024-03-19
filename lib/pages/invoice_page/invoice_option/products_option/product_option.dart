import 'dart:developer';
import 'dart:ui';

import 'package:invoice_genertor/pages/utills/headers.dart';

class ProductOptionPage extends StatefulWidget {
  const ProductOptionPage({super.key});

  @override
  State<ProductOptionPage> createState() => _ProductOptionPageState();
}

class _ProductOptionPageState extends State<ProductOptionPage> {
  @override
  void initState() {
    if (Globals.controller.length > 2) {
      Globals.controller.removeWhere((element) => element.text.isEmpty);
    }
    if (Globals.controller.isEmpty || Globals.controller.length < 2) {
      log("RELOADING....................");
      // Globals.skill = [
      //   '',
      //   '',
      // ];
      if (Globals.controller.length == 1) {
        Globals.controller.add(TextEditingController());
      } else {
        Globals.controller.addAll([
          TextEditingController(),
          TextEditingController(),
        ]);
      }
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar(heading: "Product Option", context: context),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // HeadingText    ===========================================================================
                        const Text(
                          'Product Details',
                          style: TextStyle(fontSize: 20),
                        ),
                        ...List.generate(
                          Globals.controller.length,
                          (index) => Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration:
                                      const InputDecoration(hintText: "Name"),
                                  // controller: Globals.controller[index],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.015,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration:
                                      const InputDecoration(hintText: "Price"),
                                  // controller: Globals.controller[index],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.015,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Quantity"),
                                  // controller: Globals.controller[index],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.015,
                              ),
                              // DetectButton ======================================================================
                              IconButton(
                                onPressed: () {
                                  Globals.controller.removeAt(index);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Globals.controller.add(TextEditingController());
                            setState(() {});
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
