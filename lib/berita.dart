import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week3task2/api.dart';

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  Future<List> getData() async {
    final response = await http.get(GetLinknya.linknya + "get_berita.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Udacoding News",
            style: TextStyle(color: Colors.black, fontSize: 25),
          )),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          height: 130,
          padding: EdgeInsets.fromLTRB(5, 1, 5, 4),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailBerita(list, index);
              }));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          GetLinknya.linknya + list[index]['foto'],
                          fit: BoxFit.fitHeight,
                          height: 100.0,
                          width: 120,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 1, 10, 5),
                          child: Column(
                            children: [
                              Text(
                                list[index]['judul'],
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 16),
                              ),
                              Text(
                                " ${list[index]['tgl_berita']}",
                                style: TextStyle(color: Colors.brown),
                              ),
                              Text(
                                " ${list[index]['isi']}",
                                maxLines: 3,
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailBerita extends StatelessWidget {
  List list;
  int index;

  DetailBerita(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background:
                      Image.network(GetLinknya.linknya + list[index]['foto']),
                ),
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(32.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(list[index]['tgl_berita']),
                          Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              list[index]['judul'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Text(
                  list[index]['isi'],
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
