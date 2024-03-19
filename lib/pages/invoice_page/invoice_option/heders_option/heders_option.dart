import 'package:invoice_genertor/pages/utills/headers.dart';

class HedersOptionPage extends StatefulWidget {
  const HedersOptionPage({super.key});

  @override
  State<HedersOptionPage> createState() => _HedersOptionPageState();
}

class _HedersOptionPageState extends State<HedersOptionPage> {
  // forChoiceRow
  bool _Profile = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextStyle headingStyle = const TextStyle(
      fontSize: 36,
      color: Colors.white,
      // color: Color(0xffDDE6ED),
      shadows: <Shadow>[
        Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 0.5,
          color: Colors.grey,
        ),
      ],
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        // ===========================================
        appBar: appBar(heading: "Header Option", context: context),
        backgroundColor: Colors.grey.shade300,
        // ============================================
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Choice Row============================
              // ChoiceRow
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     //=====================================================
              //     // Form
              //     GestureDetector(
              //       onTap: () {
              //         _Profile = true;
              //         setState(() {});
              //       },
              //       child: Container(
              //         height: size.height * 0.055,
              //         width: size.width * 0.45,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           border: _Profile
              //               ? Border.all(color: Colors.white).scale(2)
              //               : Border.all(color: Colors.black45),
              //           color: const Color(0xff27374D),
              //           borderRadius: const BorderRadius.only(
              //             bottomRight: Radius.circular(35),
              //             topLeft: Radius.circular(35),
              //           ),
              //           boxShadow: const [
              //             BoxShadow(
              //               offset: Offset(4, 4),
              //               color: Colors.grey,
              //               blurRadius: 5,
              //             ),
              //           ],
              //         ),
              //         child: Text(
              //           "Profile",
              //           style: headingStyle,
              //         ),
              //       ),
              //     ),
              //     //=====================================================
              //     // Picker
              //     GestureDetector(
              //       onTap: () {
              //         _Profile = false;
              //         setState(() {});
              //       },
              //       child: Container(
              //         height: size.height * 0.055,
              //         width: size.width * 0.45,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           border: _Profile == false
              //               ? Border.all(color: Colors.white).scale(2)
              //               : Border.all(color: Colors.black45),
              //           color: const Color(0xff27374D),
              //           borderRadius: const BorderRadius.only(
              //             topRight: Radius.circular(35),
              //             bottomLeft: Radius.circular(35),
              //           ),
              //           boxShadow: const [
              //             BoxShadow(
              //               offset: Offset(4, 4),
              //               color: Colors.grey,
              //               blurRadius: 5,
              //             ),
              //           ],
              //         ),
              //         child: Text(
              //           "Picture",
              //           style: headingStyle,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              formWidget(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
