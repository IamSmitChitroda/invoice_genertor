import 'dart:developer';

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
    pw.TextStyle(fontSize: 35, fontWeight: pw.FontWeight.bold);

Future<Uint8List> getPdf({required Size size}) async {
  ByteData byteData = await rootBundle.load("lib/assets/logo.png");
  //----------------------------------------------------------------
  pw.Document pdf = pw.Document();
  //---------------------------------------------------------------
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Column(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(5),
                height: 100,
                width: double.infinity,
                // color: PdfColors.grey,
                child: pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Invoice',
                          style: pw.TextStyle(
                            fontSize: 28,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Spacer(),
                        pw.Text(
                            'Name\t\t\t : ${Globals.globals.firstName} ${Globals.globals.lastName}',
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Text(
                            'Date\t\t\t : ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                        pw.Text('Bill No : ${Globals.globals.billNumber}'),
                      ],
                    ),
                    pw.Spacer(),
                    pw.Image(
                      pw.MemoryImage(
                        byteData.buffer.asUint8List(),
                      ),
                      height: 140,
                    ),
                  ],
                ),
              ),
              //Data Table
              pw.SizedBox(height: 10),
              pw.Container(
                padding: const pw.EdgeInsets.all(5),
                height: 500,
                width: double.infinity,
                // color: PdfColors.grey,
                child: pw.Row(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      width: 50,
                      height: 480,
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(width: 1.5, color: PdfColors.black),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'No.',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(height: 10),
                          ...Globals.nameController.map(
                            (e) => pw.Text(
                              '${Globals.nameController.indexOf(e) + 1}',
                              style: const pw.TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      width: 200,
                      height: 480,
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(width: 1.5, color: PdfColors.black),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'Title',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(height: 10),
                          ...Globals.nameController.map(
                            (e) => pw.Text(
                              e.text,
                              style: const pw.TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      width: 65,
                      height: 480,
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(width: 1.5, color: PdfColors.black),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'Qty.',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(height: 10),
                          ...Globals.quentyController.map(
                            (e) => pw.Text(
                              e.text,
                              style: const pw.TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      width: 55,
                      height: 480,
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(width: 1.5, color: PdfColors.black),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            'Val',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(height: 10),
                          ...Globals.priceController.map(
                            (e) => pw.Text(
                              Globals.priceController.isNotEmpty ? e.text : "0",
                              style: const pw.TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      width: 70,
                      height: 480,
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(width: 1.5, color: PdfColors.black),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Column(
                        children: [
                          //============================================================================================================================================================================================================================================================================================================
                          pw.Text(
                            'Amt.',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 20),
                          ),
                          pw.SizedBox(height: 10),
                          ...Globals.priceController.map(
                            (e) => pw.Text(
                              (
                                      //-------------------------------
                                      e.text.isNotEmpty
                                          ? int.parse(e.text) *
                                              int.parse(Globals
                                                  .quentyController[Globals
                                                      .priceController
                                                      .indexOf(e)]
                                                  .text)
                                          : "0"
                                  //--------------------------------
                                  )
                                  .toString(),
                              style: const pw.TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Container(
                padding: const pw.EdgeInsets.all(5),
                width: double.infinity,
                height: 30,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(width: 1.5, color: PdfColors.black),
                  borderRadius: pw.BorderRadius.circular(5),
                ),
                child: pw.Row(
                  children: [
                    pw.SizedBox(width: 150),
                    pw.Text(
                      'Total',
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Spacer(),
                    pw.Text(
                      '${Globals.totalValue} Rs.',
                      style: const pw.TextStyle(fontSize: 18),
                    ),
                    pw.SizedBox(width: 10),
                  ],
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Container(
                padding: const pw.EdgeInsets.all(5),
                width: double.infinity,
                height: 68.5,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(width: 1.5, color: PdfColors.black),
                  borderRadius: pw.BorderRadius.circular(5),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "- Thank you for choosing Shree Hari Electric. We appreciate your business!",
                      style: const pw.TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "- Contact: Jayesh bhai Chitroda \t:\t 9909262233",
                      style: const pw.TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    pw.Text(
                      "- Contact: Arvind bhai Chauhan \t:\t 9825184912",
                      style: const pw.TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
  //---------------------------------------------------------------
  return pdf.save();
}

class _PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    Globals.globals.calculateTotalValue();
    log("sum : ${Globals.totalValue}");
    super.initState();
  }

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
