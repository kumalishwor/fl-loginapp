import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";

  void _clearButton() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            //image/profile
            Image.asset(
              'images/login.png',
              width: 120.0,
              height: 120.0,
            ),

            // Form
            Container(
              height: 185.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: [
                  //username textfield
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                        hintText: "Username", icon: Icon(Icons.person)),
                  ),
                  //password textfield
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  // paddings
                  const Padding(padding: EdgeInsets.all(10.5)),

                  // buttons
                  Center(
                    child: Row(
                      children: [
                        // Login button
                        Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.redAccent,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16.9, color: Colors.white),
                            ),
                          ),
                        ),
                        // Clear button
                        Container(
                          margin: const EdgeInsets.only(left: 128.0),
                          child: RaisedButton(
                            onPressed: _clearButton,
                            color: Colors.redAccent,
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                  fontSize: 16.9, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Padding
            const Padding(padding: EdgeInsets.all(14.0)),

            // Success or Ivalid Message
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Welcome, $_welcomeString",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
