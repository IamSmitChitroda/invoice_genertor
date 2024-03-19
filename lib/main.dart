import 'package:invoice_genertor/pages/utills/headers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoute.splashscreen: (context) => const SplashScreen(),
        MyRoute.homepage: (context) => const HomePage(),
        MyRoute.invoicePage: (context) => const Invoice_Page(),
        MyRoute.pdfPage: (context) => const PdfPage(),
        MyRoute.invoiceOption[0]['route']: (context) =>
            const HedersOptionPage(),
        MyRoute.invoiceOption[1]['route']: (context) =>
            const ProductOptionPage(),
      },
    );
  }
}
