import 'dart:io';

import 'package:boosky/api/book_service.dart';
import 'package:boosky/screens/take_photo.dart';
import 'package:flutter/material.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  final urlController = TextEditingController();

  String? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: authorController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Author"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'author';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "description"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: urlController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Url"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () {
                        goTakePhoto(context);
                      },
                      child: _image != null
                          ? SizedBox(
                              width: 250,
                              height: 280,
                              child: Image.file(File(_image!)),
                            )
                          : const Icon(
                              Icons.add_a_photo_sharp,
                              size: 196,
                            ),
                    )),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sendData(nameController.text, authorController.text,
                            descriptionController.text, urlController.text);
                        nameController.clear();
                        authorController.clear();
                        descriptionController.clear();
                        urlController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Processing Data")));
                      }
                    },
                    child: const Text("Submit"))
              ],
            ),
          )),
    );
  }

  void sendData(
      String name, String author, String description, String url) async {
    //await BooksService().uploadImage(_image!);
    await BooksService().NewBook(name, author, description, url);
  }

  void goTakePhoto(BuildContext context) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TakePhoto()));
    if (result != null) {
      setState(() {
        _image = result;
      });
    }
  }
}
