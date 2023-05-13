import 'package:boosky/state/book_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10),
              ]),
              child: Image.network(book.imgUrl),
            ),
          ),
          BookInfo(
              id: book.id,
              name: book.name,
              author: book.author,
              description: book.description)
        ]),
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  final String id;
  final String author;
  final String description;
  final String name;

  const BookInfo(
      {super.key,
      required this.id,
      required this.name,
      required this.author,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            author,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          BookAction(bookId: id),
        ],
      ),
    );
  }
}

class BookAction extends StatelessWidget {
  final String bookId;
  const BookAction({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookShelfBloc, BookShelfState>(
        builder: (context, bookshelf) {
      if (bookshelf.booksId.contains(bookId)) {
        return ElevatedButton(
            onPressed: () {
              removeBookShelf(context, bookId);
            },
            child: const Text("Remove Book"));
      } else {
        return ElevatedButton(
            onPressed: () {
              addBookShelf(context, bookId);
            },
            child: const Text("Add Book to Shelf"));
      }
    });
  }

  void addBookShelf(BuildContext context, bookId) {
    var bookShelfBloc = context.read<BookShelfBloc>();
    bookShelfBloc.add(AddBookShelfEvent(bookId));
  }

  void removeBookShelf(BuildContext context, bookId) {
    var bookShelfBloc = context.read<BookShelfBloc>();
    bookShelfBloc.add(RemoveBookShelfEvent(bookId));
  }
}
