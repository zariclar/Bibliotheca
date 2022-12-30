import 'package:bookshelf_app/model/book_entry.dart';
import 'package:flutter/material.dart';

import '../entry_manager.dart';

class BooksPage extends StatelessWidget {
  final List<BookEntry> entries;
  final Function deleteEntry;

  BooksPage(this.entries, this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.orange,
              automaticallyImplyLeading: false,
              title: Text('Menu'),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Center(child: Text('Add a book for your Bookshelf')),
                enableFeedback: true,
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/manage');
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(100)),
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Center(child: Text('Exit')),
                enableFeedback: true,
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Your Bookshelf'),
      ),
      body: EntryManager(entries, deleteEntry),
    );
  }
}
