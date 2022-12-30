import 'package:bookshelf_app/pages/auth.dart';
import 'package:flutter/material.dart';

class Creat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Creat();
  }
}

class _Creat extends State<Creat> {
  String _username = '';
  String _email = '';
  String _password = '';

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Create Account Page'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, top: 70.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/background.png",
              height: 350,
              width: 350,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Enter a Username'),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Enter an email'),
              onChanged: (String value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Enter a Password'),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple
                ),
              child: Text('Sign up'),
              onPressed: () {
                if (_email.length > 0 && _password.length > 0 && _username.length > 0 ) {
                  email = _email;
                  password = _password;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AuthPage(email, password)));
                }
                else{
                  final snackBar = SnackBar(
                      content: Text("Enter the correct values!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
