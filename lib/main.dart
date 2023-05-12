import 'package:boosky/screens/book_shelf.dart';
import 'package:boosky/screens/categories.dart';
import 'package:boosky/screens/home.dart';
import 'package:boosky/state/book_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookShelfBloc(BookShelfState([])),
      child: MaterialApp(
        title: 'Booksy',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const BooksyApp(title: 'Boosky'),
      ),
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

  static List<Widget> pages = [Home(), const Categories(), BookShelf()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: "Biblioteca"),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories), label: "Mi Estante")
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
