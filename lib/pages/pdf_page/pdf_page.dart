import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:invoice_genertor/pages/utills/headers.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

Future<Uint8List> getPdf({required Size size}) async {
  final ByteData byteData = await rootBundle.load("lib/assets/logo.png");

  final pw.Document pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          padding: const pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Invoice',
                    style: pw.TextStyle(
                      fontSize: 28,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Image(
                    pw.MemoryImage(byteData.buffer.asUint8List()),
                    height: 110,
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Name: ${Globals.globals.firstName} ${Globals.globals.lastName}',
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.Text(
                'Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.Text(
                'Bill No: ${Globals.globals.billNumber}',
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                border: null,
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.grey300),
                headers: ['No.', 'Title', 'Qty.', 'Val', 'Amt.'],
                headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
                cellStyle: const pw.TextStyle(fontSize: 16),
                data: List<List>.generate(
                  Globals.nameController.length,
                  (index) => [
                    (index + 1).toString(), // No.
                    Globals.nameController[index].text, // Title
                    Globals.quentyController[index].text, // Qty.
                    Globals.priceController[index].text, // Val
                    (int.parse(Globals.quentyController[index].text.isNotEmpty
                                ? Globals.quentyController[index].text
                                : "0") *
                            int.parse(
                                Globals.priceController[index].text.isNotEmpty
                                    ? Globals.priceController[index].text
                                    : "0"))
                        .toString(), // Amt.
                  ],
                ),
              ),
              pw.Spacer(),
              pw.SizedBox(height: 20),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Total:',
                    style: const pw.TextStyle(fontSize: 20),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(
                    '${Globals.totalValue} Rs.',
                    style: const pw.TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Thank you for choosing us!',
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.Text(
                '\nJayesh Chitroda : 9909262233\nArvid Chauhan   : 9825184912',
                style: const pw.TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}

class _PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    Globals.globals.calculateTotalValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PdfPreview(
        build: (PdfPageFormat format) => getPdf(size: size),
      ),
    );
  }
}
