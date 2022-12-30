import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bookshelf_app/book_card.dart';
import 'package:bookshelf_app/model/gutendex_response.dart';

class BookSearchPage extends StatefulWidget {
  final Function addEntry;
  BookSearchPage(this.addEntry);

  @override
  State<StatefulWidget> createState() {
    return _BookSearchPage();
  }
}

class _BookSearchPage extends State<BookSearchPage> {
  static const Duration BUFFER = Duration(milliseconds: 500);
  String _query = '';
  String _qwe = "";
  GBooksResponse? _results;
  late int _queryHash;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter A Book Name'),
                onChanged: (String value) {
                  setState(() {
                    _qwe = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text("search"),
                onPressed: () {
                  setState(() {
                    _query = _qwe;
                    _results = null;
                    _queryHash = _query.hashCode;
                    _delaySearch();
                  });
                },
                //icon: Icon(Icons.search_sharp)
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  /// build performant ListView
  Widget _buildResults() {
    return _results != null && _query.length > 0
        ? ListView.builder(
            itemBuilder: _buildResult,
            itemCount: _results!.items.length,
          )
        : Center(
            child: Text('Start typing to show results!'),
          );
  }

  /// build each visual entry in the ListView
  Widget _buildResult(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        widget.addEntry(_results!.items[index]);
        Navigator.pushReplacementNamed(context, '/books');
      },
      child: BookCard(_results!.items[index]),
    );
  }

  /// only execute the search if query hasn't been updated in 1 second
  void _delaySearch() {
    int currentQueryHash = _queryHash;
    Timer(BUFFER, () => _delaySearchHelper(currentQueryHash));
  }

  /// ensure no changes have been made since the last keystroke before searching
  void _delaySearchHelper(int oldQueryHash) {
    if (oldQueryHash == _queryHash) _search();
  }

  /// asynchronously search Google Books API volumes for user's query
  Future _search() async {
    // empty query
    final queryParameters = {
      'search': _query,
    };

    final url = Uri.http('gutendex.com', '/books/', queryParameters);
    print("executing search... --> $url");

    // execute asynchronous search and set the state when it returns a result

    final jsonResponse = await http.get(url);
    final jsonBody = jsonDecode(jsonResponse.body);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _results = GBooksResponse.fromJson(jsonBody);
    });
  }
}
