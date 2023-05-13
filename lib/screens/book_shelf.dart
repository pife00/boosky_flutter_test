import 'package:boosky/api/book_service.dart';
import 'package:boosky/screens/add_book.dart';
import 'package:boosky/state/book_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book.dart';
import 'book_details.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookShelfBloc, BookShelfState>(
        builder: ((context, state) {
      if (state.booksId.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Esperando Libros",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddBook()))
                      },
                  child: const Text("Add Book"))
            ],
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemCount: state.booksId.length,
            itemBuilder: (context, index) {
              return BookCoverItem(bookId: state.booksId[index]);
            }),
      );
    }));
  }
}

class BookCoverItem extends StatefulWidget {
  final String bookId;
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

  void _getBook() async {
    var bookSingle = await BooksService().getBook(widget.bookId);
    setState(() {
      book = bookSingle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookShelfBloc, BookShelfState>(
        builder: ((context, state) {
      return book == null
          ? const Center(child: CircularProgressIndicator())
          : InkWell(
              onTap: () => openBook(context, book),
              child: Ink.image(
                  fit: BoxFit.cover,
                  image: NetworkImage(state.urlBase + book!.imgUrl)),
            );
    }));
  }

  openBook(BuildContext context, Book? book) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookDetails(book: book!)));
  }
}
