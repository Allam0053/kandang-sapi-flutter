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
                  child: Image.asset('assets/img/logo/logo.png'),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title:
                  Text('Berita', style: Theme.of(context).textTheme.headline5),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Kamus Ternak',
                  style: Theme.of(context).textTheme.headline5),
              onTap: () {
                Navigator.pushNamed(context, '/dictionary');
              },
            ),
            ListTile(
              title: Text('Galeri Sapi',
                  style: Theme.of(context).textTheme.headline5),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            ListTile(
              title:
                  Text('Sign in', style: Theme.of(context).textTheme.headline5),
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
