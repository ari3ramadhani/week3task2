import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'berita.dart';
import 'kamus.dart';
import 'profile.dart';

class PageHome extends StatefulWidget {
  final VoidCallback signOut;

  PageHome(this.signOut);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var loading = false;

//proses get data on background
  Future<Null> getData() async {
    setState(() {
      loading = true; //ketika proses get data set loading nya true
    });
  }

//tambahan method signout
  signOut() async {
    setState(() {
      widget.signOut();
    });
  }

//mengambil nilai dari shared preferences
  String username = "", fullname = "";

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString("username");
      fullname = sharedPreferences.getString("fullname");
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getDataPref();
    _tabController = TabController(length: 3, vsync: this);
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          Berita(),
          Kamus(),
          Profile(signOut),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: BottomAppBar(
          child: TabBar(
        labelColor: Colors.lightGreen,
        unselectedLabelColor: Colors.blueGrey,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(text: "Dictionary", icon: Icon(Icons.chat)),
          Tab(text: "Profile", icon: Icon(Icons.person)),
        ],
        controller: _tabController,
      )),
    );
  }
}
