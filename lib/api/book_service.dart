import 'dart:developer';

import 'package:boosky/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

final List<Book> books = [];

class BooksService {
  Future<List<Book>> getLastBook() async {
    List<Book> data = [];
    List temp = [];

    await db.collection("books").get().then((event) {
      for (var doc in event.docs) {
        temp.add(doc.data());
      }
    });

    for (var item in temp) {
      var book = Book("1", item["name"], item["author"], item["description"],
          item["imgUrl"]);
      data.add(book);
    }

    return Future.value(data);
  }

  Future<Book> getBook(int bookId) async {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books[0]));
  }
}
