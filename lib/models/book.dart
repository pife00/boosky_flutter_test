class Book {
  final String id;
  final String name;
  final String author;
  final String description;
  final String imgUrl;

  Book(this.id, this.name, this.author, this.description, this.imgUrl);

  Book.fromJson(String id, Map<String, dynamic> json)
      : this(id, json['name'] as String, json["author"] as String,
            json['description'] as String, json["imgUrl"] as String);
}
