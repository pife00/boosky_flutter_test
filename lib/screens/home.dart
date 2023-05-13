import 'dart:developer';

import 'package:boosky/api/book_service.dart';
import 'package:boosky/screens/book_details.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _getLastBooks();
  }

  void _getLastBooks() async {
    var lastBook = await BooksService().getLastBook();

    setState(() {
      books = lastBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("HOME:$books");
    return books.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: books.length + 1,
            itemBuilder: ((context, index) {
              if (index == 0) {
                return const Header(
                    imgUrl:
                        "https://storage.googleapis.com/pixa-wall-6dae7.appspot.com/splash_art/Annie/Annie-Versary_preview.jpg");
              }
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(6),
                      child: ListCard(book: books[index - 1])),
                ],
              );
            }));
  }
}

class Header extends StatelessWidget {
  const Header({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imgUrl);
  }
}

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          height: 150,
          child: Row(children: [
            InkWell(
              onTap: () => openBook(context, book),
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.network(book.imgUrl)),
            ),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        book.author,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      book.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      book.description,
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
            )
          ])),
    );
  }
}

void openBook(BuildContext context, Book book) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => BookDetails(book: book)));
}
