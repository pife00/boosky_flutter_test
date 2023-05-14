import 'dart:io';
import 'dart:math';

import 'package:boosky/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final db = FirebaseFirestore.instance;
final storage =
    FirebaseStorage.instanceFor(bucket: "gs://boosky-50cf5.appspot.com");
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
      var book = Book(item['id'], item["name"], item["author"],
          item["description"], item["imgUrl"]);
      data.add(book);
    }

    return Future.value(data);
  }

  Future<Book> getBook(String bookId) async {
    var temp = [];
    List<Book> data = [];
    await db
        .collection("books")
        .where("id", isEqualTo: bookId)
        .get()
        // ignore: avoid_types_as_parameter_names
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        temp.add(element.data());
      }
    });

    for (var item in temp) {
      var book = Book(item['id'], item['name'], item['author'],
          item['description'], item['imgUrl']);
      data.add(book);
    }

    return Future.value(data[0]);
  }

  NewBook(String name, String author, String description, String url) async {
    final String id = Random().nextInt(400).toString();
    final document = <String, String>{
      "id": id,
      "name": name,
      "author": author,
      "description": description,
      "imgUrl": url,
    };
    db
        .collection("books")
        .doc(id)
        .set(document)
        .onError((error, stackTrace) => print("Error writing document: $e"));
  }

  Future<void> uploadImage(String data) async {
    File image = File(data);
    final storageRef =
        FirebaseStorage.instance.ref("books/mountain.jpg").putFile(image);
  }
}
