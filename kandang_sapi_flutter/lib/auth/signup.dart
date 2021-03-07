import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool visibleProgressIndicator = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  Future<List> signup() async {
    setState(() {
      visibleProgressIndicator = true;
    });

    var response =
        await http.post("http://iwandepee.000webhostapp.com/signup.php", body: {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    setState(() {
      visibleProgressIndicator = false;
    });

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(response.body),
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
      signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).accentColor,
          height: MediaQuery.of(context).size.height * 0.88,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header text big Welcome back
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Membuat\nAkun Baru",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Wrap form input and sign in button
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name edit text
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: _nameController,
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
                            decoration: InputDecoration(
                              labelText: 'Nama',
                              labelStyle: TextStyle(color: Colors.grey),
                              errorStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),

                        // Email edit text
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: _emailController,
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
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
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
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

                        // Confirm password edit text
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: _confirmPassController,
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
                            decoration: InputDecoration(
                              labelText: 'Konfirmasi Password',
                              labelStyle: TextStyle(color: Colors.grey),
                              errorStyle: TextStyle(color: Colors.white),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Korfirmasi password tidak boleh kosong';
                              }
                              if (value != _passwordController.text) {
                                return 'Konfirmasi password tidak sama';
                              }
                              return null;
                            },
                          ),
                        ),

                        // Sign Up button
                        FlatButton(
                          child: Text('DAFTAR'),
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

                // Progress indicator while storing data to database
                Visibility(
                  visible: visibleProgressIndicator,
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                ),

                // Signup if dont have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun?? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      child: Text(
                        'MASUK',
                        style: TextStyle(color: Theme.of(context).buttonColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
