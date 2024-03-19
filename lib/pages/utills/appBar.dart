import 'headers.dart';

AppBar appBar({required String heading, required BuildContext context}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.white,
    ),
    centerTitle: true,
    title: Text(
      heading,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: const Color(0xff2D3250),
  );
}
