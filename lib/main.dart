import 'package:boosky/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booksy',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const BooksyApp(title: 'Boosky'),
    );
  }
}

class BooksyApp extends StatefulWidget {
  const BooksyApp({super.key, required this.title});

  final String title;

  @override
  State<BooksyApp> createState() => _BooksyAppState();
}

class _BooksyAppState extends State<BooksyApp> {
  int _selectIndex = 0;

  static List<Widget> pages = [Home(), Text("Library")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: "Biblioteca")
          ],
          currentIndex: _selectIndex,
          onTap: onItemActive,
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: pages[_selectIndex]);
  }

  void onItemActive(int value) {
    setState(() {
      _selectIndex = value;
    });
  }
}
