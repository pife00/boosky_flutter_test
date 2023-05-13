import 'package:boosky/models/book_categories.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BookCategories();
  }
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class BookCategories extends StatelessWidget {
  List<CategoriesBook> categories = [
    CategoriesBook(1, "PROJECT"),
    CategoriesBook(2, "Crystal Rose"),
    CategoriesBook(3, "DJ"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return TileCategory(BookCategory: categories[index]);
          }),
    );
  }
}

class TileCategory extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const TileCategory({super.key, required this.BookCategory});

  // ignore: non_constant_identifier_names
  final CategoriesBook BookCategory;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          alignment: Alignment.center,
          child: Text(
            BookCategory.name,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
