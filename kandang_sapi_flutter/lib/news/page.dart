import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kadang_sapi_flutter/util/drawer.dart';
import 'package:kadang_sapi_flutter/news/detail.dart';
import 'widget.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<Newsdata>> fetchNews() async {
    print('fetching');
    var response =
        await http.get("http://allamcowsmoo.000webhostapp.com/news.php");
    print('fetch done');

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<Newsdata> listOffNews = items.map<Newsdata>((json) {
        return Newsdata.fromJson(json);
      }).toList();
      return listOffNews;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      drawer: DrawerComponent(),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("Berita"),
      ),
      body: FutureBuilder<List<Newsdata>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map((data) => Container(
                margin: EdgeInsets.only(top: 20.0),
                child: NewsCard(data: data),
              )).toList(),
        );

          // return ListView(
          //   children: snapshot.data
          //       .map((data) => Container(
          //             decoration:
          //                 BoxDecoration(color: Theme.of(context).accentColor),
          //             margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          //             height: MediaQuery.of(context).size.height * 0.15,
          //             child: Row(
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.all(5),
          //                   child: AspectRatio(
          //                     aspectRatio: 1,
          //                     child: Image.network(data.imageURL,
          //                         fit: BoxFit.cover),
          //                   ),
          //                 ),
          //                 Expanded(
          //                   child: InkWell(
          //                     child: Container(
          //                       alignment: Alignment.topLeft,
          //                       padding: EdgeInsets.all(5),
          //                       child: Text(
          //                         data.title,
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 18,
          //                         ),
          //                       ),
          //                     ),
          //                     onTap: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) =>
          //                               NewsDetailPage(data: data),
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ))
          //       .toList(),
          // );
        },
      ),
    );
  }
}




// class DashboardPage extends StatefulWidget {
//   @override
//   DashboardPageState createState() => DashboardPageState();
// }

// class DashboardPageState extends State<DashboardPage>{

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[900],
//         leading: IconButton(icon: Icon(Icons.logout, color: Colors.white,), onPressed: () {Navigator.pop(context);}),
//         title: Text(
//           'Dashboard',
//           style: TextStyle(fontFamily: 'Nunito', color: Colors.white,),
//         ),
//       ),
//       backgroundColor: const Color(0xFF3B4254),
//       body: Column(
//         children: [
//           SizedBox(height: 20.0),
//           Container(
//             margin: EdgeInsets.only(top: 40.0),
//             child: DashboardCard(descript: 'Hitung Fisika', link: '/hitung-fisika',)),
//           Container(
//             margin: EdgeInsets.only(top: 20.0),
//             child: DashboardCard(descript: 'Konversi Nilai Satuan Panjang', link: '/konversi',)),

//         ],
//       ),
//     );
//   }
// }