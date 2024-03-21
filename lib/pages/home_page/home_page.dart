import 'package:invoice_genertor/pages/utills/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff2D3250),
      ),
      backgroundColor: Colors.grey.shade200,
      body: const Padding(
        padding: EdgeInsets.all(16),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, MyRoute.invoicePage);
        },
        // backgroundColor: Colors.grey.withOpacity(0.7),
        backgroundColor: const Color(0xffcae1f3),
        label: const Text(
          "Create",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(Icons.create),
      ),
    );
  }
}
