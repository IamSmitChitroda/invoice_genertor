import 'package:invoice_genertor/pages/utills/headers.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

pw.TextStyle nameStyle =
    pw.TextStyle(fontSize: 52, fontWeight: pw.FontWeight.bold);

Future<Uint8List> getPdf({required Size size}) async {
  ByteData byteData = await rootBundle.load("lib/assets/logo.png");
  //----------------------------------------------------------------
  pw.Document pdf = pw.Document();
  //---------------------------------------------------------------
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        children: [
          pw.SizedBox(
            height: size.height * 0.01,
          ),
          pw.Container(
            color: PdfColors.grey,
            // Profile ---------------------------------------
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                // Profile Image ----------------------------------
                pw.ClipOval(
                  child: pw.Container(
                    height: 150,
                    width: 150,
                    decoration: pw.BoxDecoration(
                      image: pw.DecorationImage(
                        image: pw.MemoryImage(
                          byteData.buffer.asUint8List(),
                        ),
                      ),
                    ),
                  ),
                ),
                //FirstName ---------------------------------------
                pw.Text(
                  Globals.globals.firstName.toString().replaceFirst(
                      Globals.globals.firstName.toString()[0],
                      Globals.globals.firstName.toString()[0].toUpperCase()),
                  style: nameStyle,
                ),
                //LastName ----------------------------------------
                pw.Text(
                  " ${Globals.globals.lastName.toString().replaceFirst(Globals.globals.lastName.toString()[0], Globals.globals.lastName.toString()[0].toUpperCase())}",
                  style: nameStyle,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
  //---------------------------------------------------------------
  return pdf.save();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PdfPreview(
        build: (PdfPageFormat format) => getPdf(size: size),
      ),
    );
  }
}
