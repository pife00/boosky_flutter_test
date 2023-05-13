import 'dart:developer';

import 'package:boosky/api/book_service.dart';
import 'package:boosky/state/book_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookShelfBloc, BookShelfState>(
        builder: ((context, state) {
      log("${state.booksId}");
      if (state.booksId.isEmpty) {
        return Center(
            child: Text(
          "Esperando Libros",
          style: Theme.of(context).textTheme.titleLarge,
        ));
      }
      return Container(
          margin: const EdgeInsets.all(16),
          child: Text(
              "el id es :${state.booksId}") /* GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemCount: 2,
          itemBuilder: (context, index) {
            return BookCoverItem(book: state. books[index]);
          }), */
          );
    }));
  }
}

class BookCoverItem extends StatefulWidget {
  final Book bookId;
  const BookCoverItem({super.key, required this.bookId});

  @override
  State<BookCoverItem> createState() => _BookCoverItemState();
}

class _BookCoverItemState extends State<BookCoverItem> {
  Book? book;

  @override
  void initState() {
    super.initState();
    _getBook();
  }

  @override
  Widget build(BuildContext context) {
    return book == null
        ? const Center(child: CircularProgressIndicator())
        : InkWell(
            onTap: () {},
            child:
                Ink.image(fit: BoxFit.cover, image: NetworkImage(book!.imgUrl)),
          );
  }

  void _getBook() async {
    var bookSingle = await BooksService().getBook(1);
    setState(() {
      book = bookSingle;
    });
  }
}
