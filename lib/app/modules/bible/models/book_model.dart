class BookModel {
  String abbrevPT;
  String abbrevEN;
  String author;
  int chapters;
  String group;
  String name;
  String testament;

  BookModel({
    required this.abbrevEN,
    required this.abbrevPT,
    required this.author,
    required this.chapters,
    required this.group,
    required this.name,
    required this.testament,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      abbrevEN: json['abbrev']['en'],
      abbrevPT: json['abbrev']['pt'],
      author: json['author'],
      chapters: json['chapters'],
      group: json['group'],
      name: json['name'],
      testament: json['testament'],
    );
  }
}
