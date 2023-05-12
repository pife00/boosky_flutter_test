import 'package:boosky/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

final List<Book> books = [];

class BooksService {
  Future<List<Book>> getLastBook() async {
    List<Book> data = [];
    final docRef = db.collection("books");
    docRef.get().then((dynamic doc) {
      data = doc.data() as List<Book>;
    });
    return data;
  }

  Future<Book> getBook(int bookId) async {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books[0]));
  }
}
