import 'package:flutter/material.dart';

import 'search_reguest.dart';

class ManageBooksPage extends StatelessWidget {
  final Function addEntry;
  final Function deleteEntry;

  ManageBooksPage(this.addEntry, this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.blueGrey,
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Center(child: Text('Your Bookshelf')),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/books');
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
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Bookshelf Management'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.search),
                text: 'Search for Books',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BookSearchPage(addEntry),
          ],
        ),
      ),
    );
  }
}
