import 'package:flutter/material.dart';
import 'widget.dart';
import 'item.dart';
import 'package:http/http.dart' as http;

// Define a custom Form widget.
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  String availableUsername = 'udacodingid';
  String availablePassword = 'udacodingJaya2021';

  SignUpInput username = new SignUpInput(
      controller: new TextEditingController(),
      hint: 'Username',
      icon: Icon(Icons.alternate_email, color: Color(0xFFCBD3DC),),
      type: TextInputType.emailAddress);
  SignUpInput password = new SignUpInput(
      controller: new TextEditingController(),
      hint: 'Password',
      icon: Icon(Icons.lock, color: Color(0xFFCBD3DC),),
      type: TextInputType.visiblePassword,
      hide: true);

  Future signin() async {
    var response =
        await http.post("http://allamcowsmoo.000webhostapp.com/signin.php", body: {
      'email': username.controller.text, 
      'password': password.controller.text, 
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

  authenticating(){
        // if( (username.controller.text == availableUsername) && 
        //     (password.controller.text == availablePassword)){
        //       Navigator.pushNamed(context, '/dashboard');
        //       return;
        // }

        if( username.controller.text == '' ){
          //alert username tdk boleh kosong
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('username tidak boleh kosong'),
                  );
                },
          );
        }

        if( password.controller.text == '' ){
          //alert password tdk boleh kosong
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('password tidak boleh kosong'),
                  );
                },
          );
        }else if( password.controller.text.length < 6 ){
          //alert password tdk boleh kurang dari 6
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('password tidak boleh kurang dari 6'),
                  );
                },
          );
        }else if( (username.controller.text != availableUsername) || 
                (password.controller.text != availablePassword)){
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text('Username atau Password Salah'),
                      );
                    },
          );
        }else{
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('oops something went wrong'),
                  );
                },
          );
        }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF3B4254),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 50.0),
                  child: Text(
                    'Blogging',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Nunito',
                      color: Color(0xFFCBD3DC),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 10.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SignUpTextField(item: username,),
                        SignUpTextField(item: password,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 25.0, 50.0, 5.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        TextButton(
                          onPressed: authenticating, 
                          child: SignInButton(),
                        ),

                        TextButton(
                          onPressed: () => Navigator.pushNamed(context,'/signup'), 
                          child: DoNotHaveAccount(),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpInput email = new SignUpInput(
      controller: new TextEditingController(),
      hint: 'Email',
      icon: Icon(Icons.alternate_email, color: Color(0xFFCBD3DC),),
      type: TextInputType.emailAddress);
  SignUpInput username = new SignUpInput(
      controller: new TextEditingController(),
      hint: 'Username',
      icon: Icon(Icons.alternate_email, color: Color(0xFFCBD3DC),),
      type: TextInputType.emailAddress);
  SignUpInput password = new SignUpInput(
      controller: new TextEditingController(),
      hint: 'Password',
      icon: Icon(Icons.lock, color: Color(0xFFCBD3DC),),
      type: TextInputType.visiblePassword,
      hide: true);

  Future signin() async {
    var response =
        await http.post("http://allamcowsmoo.000webhostapp.com/signup.php", body: {
      'email': email.controller.text, 
      'username' : username.controller.text, 
      'password': password.controller.text, 
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

  authenticating(){
        // if( (username.controller.text == availableUsername) && 
        //     (password.controller.text == availablePassword)){
        //       Navigator.pushNamed(context, '/dashboard');
        //       return;
        // }

        if( username.controller.text == '' ){
          //alert username tdk boleh kosong
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('username tidak boleh kosong'),
                  );
                },
          );
        }

        if( password.controller.text == '' ){
          //alert password tdk boleh kosong
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('password tidak boleh kosong'),
                  );
                },
          );
        }else if( password.controller.text.length < 6 ){
          //alert password tdk boleh kurang dari 6
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('password tidak boleh kurang dari 6'),
                  );
                },
          );
        }else{
          return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('oops something went wrong'),
                  );
                },
          );
        }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF3B4254),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 50.0),
                  child: Text(
                    'Blogging',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Nunito',
                      color: Color(0xFFCBD3DC),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SignUpTextField(item: email,),
                        SignUpTextField(item: username,),
                        SignUpTextField(item: password,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 5.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(width: 1.0, height: 10.0,),

                        TextButton(
                          onPressed: authenticating, 
                          child: SignUpButton(),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}