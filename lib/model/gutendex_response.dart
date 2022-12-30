import 'package:bookshelf_app/model/book_entry.dart';

class GBooksResponse {
  final List<BookEntry> _items;

  GBooksResponse(this._items);

  List<BookEntry> get items => _items;

  /// builds itself from json
  factory GBooksResponse.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<BookEntry> itemList =
        list.map<BookEntry>((json) => BookEntry.fromJson(json)).toList();

    return GBooksResponse(itemList);
  }
}
