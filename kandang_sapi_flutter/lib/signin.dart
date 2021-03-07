import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future signin() async {
    var response =
        await http.post("http://iwandepee.000webhostapp.com/signin.php", body: {
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    var message = response.body;

    if (message == 'Login sukses') {
      Navigator.pushNamed(context, '/');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            backgroundColor: Theme.of(context).accentColor,
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void validate() {
    if (_formKey.currentState.validate()) {
      signin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).accentColor,
          height: MediaQuery.of(context).size.height * 0.88,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(360))),
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header text big Welcome back
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Selamat Datang\nKembali",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Wrap form input and sign in button
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email edit text
                            Container(
                              padding: EdgeInsets.only(bottom: 35),
                              child: TextFormField(
                                controller: _emailController,
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  errorStyle: TextStyle(color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Password edit text
                            Container(
                              padding: EdgeInsets.only(bottom: 25),
                              child: TextFormField(
                                controller: _passwordController,
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  errorStyle: TextStyle(color: Colors.white),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Forgot password text link
                            Container(
                              padding: EdgeInsets.only(bottom: 25),
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  child: Text(
                                "Lupa Password",
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor),
                              )),
                            ),

                            // Signin button
                            FlatButton(
                              child: Text('MASUK'),
                              onPressed: validate,
                              color: Theme.of(context).buttonColor,
                              minWidth: double.infinity,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(90)),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Signup if dont have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum memiliki akun? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          child: Text(
                            'DAFTAR',
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
