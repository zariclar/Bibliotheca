class BookEntry {
  final String _title;
  final List<Authors> _authors;
  final List<String> _description;
  final String _imageLink;
  final String _ReadUrl;

  BookEntry(this._title, this._authors, this._description, this._imageLink,
      this._ReadUrl);

  String get title => _title;
  Authors get authors => _authors[0];
  List<String> get description => _description;
  String get imageLink => _imageLink;
  String get ReadUrl => _ReadUrl;

  /// knows how to build itself from json
  factory BookEntry.fromJson(Map<String, dynamic> parsedJson) {
    var title = parsedJson['title'];
    var list = parsedJson['authors'] as List;
    List<Authors> authorList = list.map((i) => Authors.fromJson(i)).toList();
    var subjectsFromJson = parsedJson['subjects'];
    List<String> subjectsList = subjectsFromJson.cast<String>();
    var formats = parsedJson['formats'];
    var imageLink = formats['image/jpeg'];
    var readUrl = formats['text/html'];

    return BookEntry(
      title,
      authorList,
      subjectsList,
      imageLink,
      readUrl,
    );
  }
}

class Authors {
  String name;

  Authors(this.name);

  /// knows how to build itself from json
  factory Authors.fromJson(dynamic parsedJson) {
    final name = parsedJson['name'];

    return Authors(name);
  }
}
