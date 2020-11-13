import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'modelkampus.dart';

class Kamus extends StatefulWidget {
  @override
  _KamusState createState() => _KamusState();
}

class _KamusState extends State<Kamus> {
  List _list = [];
  List searchnya = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get(GetLinknya.linknya + "get_kamus.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(ModelKamus.fromJson(i));
          loading = false;
        }
      });
    } else {}
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    searchnya.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.istilah.contains(text.toUpperCase()) ||
          f.id.toString().contains(text)) searchnya.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        toolbarHeight: 40,
        title: Center(
          child: Text('Health Terms',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search,color: Colors.black,size: 35,),
                  title: TextField(
                    style: TextStyle(
                        fontSize: 24.0, height: 1.0, color: Colors.black),
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel_sharp,color: Colors.red,size: 35,),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: searchnya.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchnya.length,
                            itemBuilder: (context, i) {
                              final b = searchnya[i];
                              return GestureDetector(
                                onTap: () {
                                  _openDialog(context, searchnya[i]);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 35,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Text(
                                                    b.istilah,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.lightGreenAccent,
                                                height: 45,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Text(
                                                    b.kepanjangan,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return GestureDetector(
                                onTap: () {
                                  _openDialog(context, _list[i]);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 35,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Text(
                                                    a.istilah,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.lightGreenAccent,
                                                height: 45,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Text(
                                                    a.kepanjangan,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}

void _openDialog(BuildContext context, ModelKamus data) {
  AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: DialogType.INFO,
    title: data.istilah,
    desc: data.kepanjangan,
    body: Column(
      children: [
        Center(
          child: Text(
            data.istilah,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Center(
          child: Text(data.kepanjangan,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
        Center(
          child: Text(data.detailnya,
              style: TextStyle(fontSize: 20), textAlign: TextAlign.justify),
        ),
      ],
    ),
    btnOkOnPress: () {},
    btnOkIcon: Icons.check_circle,
  ).show();
}
