class Book {
  final String id;
  final String name;
  final String author;
  final String description;
  final String imgUrl;

  Book(this.id, this.name, this.author, this.description, this.imgUrl);

  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json["name"],
        author = json["author"],
        description = json["description"],
        imgUrl = json["imgUrl"];
}
