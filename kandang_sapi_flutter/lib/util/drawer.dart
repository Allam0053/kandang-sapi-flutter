import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).accentColor,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(260),
                  child: Image.asset('assets/img/logo/logo.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title:
                  Row(
                    children: [
                      Icon(Icons.library_books_sharp),
                      Text('Berita', style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book_outlined),
                  Text('Kamus Ternak',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/dictionary');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.border_all_rounded),
                  Text('Galeri Sapi',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            ListTile(
              title:
                  Row(
                    children: [
                      Icon(Icons.login),
                      Text('Sign in', style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
