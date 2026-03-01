import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("LOGIN ADMIN",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    TextField(
                      controller: username,
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        if (username.text == "admin" &&
                            password.text == "123") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login gagal")),
                          );
                        }
                      },
                      child: Text("Login"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}