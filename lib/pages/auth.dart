import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  String email;
  String password;

  AuthPage(this.email, this.password);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState(email, password);
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email = '';
  String _password = '';
  String email;
  String password;

  List<String> email2 = ["test2"];
  List<String> password2 = ["test2"];

  _AuthPageState(this.email, this.password);

  @override
  Widget build(BuildContext context) {
    email2.add(email);
    password2.add(password);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Login Page'),
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
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
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
                  foregroundColor: Colors.deepPurple),
              child: Text('Login'),
              onPressed: () {
                if (_email == email && _password == password) {
                  Navigator.pushReplacementNamed(context, '/books');
                } else {
                  final snackBar = SnackBar(
                      content: Text("username or password is not correct!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            TextButton(
              child: Text(
                'Create An Account',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/create');
              },
            ),
          ],
        ),
      ),
    );
  }
}
