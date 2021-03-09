import 'package:flutter/material.dart';
import 'item.dart';

class SignUpTextField extends StatelessWidget {
  SignUpInput item;

  SignUpTextField({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        style: TextStyle(color: Color(0xFFCBD3DC), fontFamily: 'Nunito',),
        controller: item.controller,
        obscureText: item.hide,
        keyboardType: item.type,
        decoration: InputDecoration(
          hintText: item.hint,
          hintStyle: TextStyle(color: Colors.white12),
          prefixIcon: item.icon,
          filled: true,
          fillColor: Color(0xFF424B5E),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.white60,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class DoNotHaveAccount extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Do not Have an Account?',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromRGBO(255, 255, 255, 0.7),
            )
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Text(
          'Sign In',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Text(
          'Sign Up',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
