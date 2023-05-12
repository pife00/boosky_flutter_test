import 'package:flutter/material.dart';

import '../models/book.dart';

class BookShelf extends StatelessWidget {
  BookShelf({super.key});

  final List<Book> books = [
    Book(
        1,
        "Ahri",
        "Zorra",
        "demon and slayer in my mind, only just one me and another me why?",
        "https://storage.googleapis.com/pixa-wall-6dae7.appspot.com/champions_body/ahri.png"),
    Book(2, "Akali", "Ninja", "Everyone is back again, eveyone dude, Dos veces",
        "https://storage.googleapis.com/pixa-wall-6dae7.appspot.com/champions_body/akali.png"),
    Book(3, "Ashe", "Riot Games", "a crazy that need a nerf in her ass",
        "https://storage.googleapis.com/pixa-wall-6dae7.appspot.com/champions_body/ashe.png")
  ];

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return Center(
          child: Text(
        "Esperando Libros",
        style: Theme.of(context).textTheme.titleLarge,
      ));
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemCount: 2,
          itemBuilder: (context, index) {
            return BookCoverItem(book: books[index]);
          }),
    );
  }
}

class BookCoverItem extends StatelessWidget {
  final Book book;
  const BookCoverItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink.image(fit: BoxFit.cover, image: NetworkImage(book.imgUrl)),
    );
  }
}
