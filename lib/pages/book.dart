import 'dart:async';
import 'package:bookshelf_app/model/book_entry.dart';
import 'package:bookshelf_app/pages/ReadBook.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  static const String PLACEHOLDER = "assets/placeholder.jpg";
  final String title;
  final Authors authors;
  final List<String> description;
  final String imageUrl;
  final String ReadUrl;

  BookPage(
      this.title, this.authors, this.description, this.imageUrl, this.ReadUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone!'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Text('Remove'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  Image _renderImage() {
    return imageUrl == null
        ? Image.asset(
            PLACEHOLDER,
            height: 200,
          )
        : Image.network(
            imageUrl,
            height: 200,
          );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false); // true pops again, crashing the app
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: _renderImage(),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                _stringifyList(description),
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 1),
              child: ElevatedButton(
                //color: Theme.of(context).accentColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green
                ),
                child: Text('Read Book'),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ReadBook(ReadUrl, title))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1, right: 10, left: 10, bottom: 10),
              child: ElevatedButton(
                //color: Theme.of(context).accentColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red
                ),
                child: Text('Remove from bookshelf'),
                onPressed: () => _showWarningDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _stringifyList(List<String> list) {
    String result = '';
    list.forEach((element) {
      if (result.length > 0) result += ', ';
      result += element;
    });
    return result.length > 0 ? result : "Anonymous";
  }
}
