import 'package:flutter/material.dart';
import 'package:kadang_sapi_flutter/dictionaries/page.dart';
import 'package:kadang_sapi_flutter/gallery/page.dart';
import 'package:kadang_sapi_flutter/news/page.dart';
import 'package:kadang_sapi_flutter/auth/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF2A1B3D),
        accentColor: Color(0xFF44318D),
        buttonColor: Color(0xFFD83F87),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline4: TextStyle(fontSize: 20.0, color: Colors.white),
          headline5: TextStyle(fontSize: 18.0, color: Colors.white),
          headline6: TextStyle(fontSize: 16.0, color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      initialRoute: '/signin',
      routes: {
        '/': (context) => NewsPage(),
        '/gallery': (context) => GalleryPage(),
        '/dictionary': (context) => DictionaryPage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage()
      },
      // home: SignInPage()
      // home: SignUpPage(),
      // home: GalleryPage(),
      // home: DetailPage(),
      // home: DictionaryPage(),
      // home: DictionaryDetailPage(),
      // home: NewsDetailPage(),
      // home: NewsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
