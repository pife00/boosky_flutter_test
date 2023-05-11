import 'package:flutter/material.dart';

import '../models/book.dart';

class Home extends StatelessWidget {
  Home({super.key});
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
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(6),
                  child: ListCard(book: books[index])),
            ],
          );
        }));
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
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.network(book.imgUrl)),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.author,
                      textAlign: TextAlign.left,
                    ),
                    Text(book.name, textAlign: TextAlign.left),
                    Text(
                      book.description,
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                    )
                  ]),
            )
          ])),
    );
  }
}
