import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'api.dart';

class Profile extends StatefulWidget {
  final VoidCallback signOut;

  Profile(this.signOut);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _valGender;

  List _listGender = ["Perempuan", "Laki-laki"];

  signOut() async {
    setState(() {
      widget.signOut();
    });
  }

  String id_user = "",
      username = "",
      email = "",
      full_name = "",
      sex = "",
      alamat = "",
      gambar = "",
      password = "";

  getDataUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      id_user = sharedPreferences.getString("id_user");
      username = sharedPreferences.getString("username");
      email = sharedPreferences.getString("email");
      full_name = sharedPreferences.getString("full_name");
      sex = sharedPreferences.getString("sex");
      alamat = sharedPreferences.getString("alamat");
      gambar = sharedPreferences.getString("gambar");

      cId_user = TextEditingController(text: id_user);
      cUsername = TextEditingController(text: username);
      cEmail = TextEditingController(text: email);
      cFull_name = TextEditingController(text: full_name);
      cSex = TextEditingController(text: sex);
      cAlamat = TextEditingController(text: alamat);
      cGambar = TextEditingController(text: gambar);

      print("ini gambar kan $gambar");
      print("ini email kan $email");
    });
    final responseData =
        await http.post(GetLinknya.linknya + "profile.php", body: {
      'id_user': id_user,
    });
    final data = jsonDecode(responseData.body);
    print('data user $data');
  }

  TextEditingController cId_user = TextEditingController();
  TextEditingController cUsername = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cFull_name = TextEditingController();
  TextEditingController cSex = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cAlamat = TextEditingController();
  TextEditingController cTgl_daftar = TextEditingController();
  TextEditingController cGambar = TextEditingController();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    //getDataPref();
    getDataUser();

    //getData();
  }

  void editData() {
    var url = GetLinknya.linknya + "editUser.php";
    http.post(url, body: {
      "id_user": id_user,
      "username": cUsername.text,
      "email": cEmail.text,
      "full_name": cFull_name.text,
      "alamat": cAlamat.text,
      "sex": _valGender,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ' + full_name),
        automaticallyImplyLeading: false, //buat hilangin tombol back
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              signOut();
            },
          )
        ],
      ),
      body: Stack(children: <Widget>[
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    GetLinknya.linknya + "$gambar",
                    fit: BoxFit.fitHeight,
                    height: 200.0,
                    width: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: TextField(
                  controller: cUsername,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "username",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: TextField(
                  controller: cEmail,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Center(
                child: TextField(
                  controller: cFull_name,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Full Name",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: DropdownButton(
                      hint: Text(sex),
                      value: _valGender,
                      items: _listGender.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valGender = value;
                          cSex.text = _valGender;
                          //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: TextField(
                  controller: cAlamat,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Address",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30.0, 30, 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.green,
                elevation: 8,
                height: 40,
                textColor: Colors.white,
                child: Text(
                  'Edit Data',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  setState(() {
                    _openDialog(context);
                    editData();
                  });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void _openDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      body: Column(
        children: [
          Center(
            child: Text(
              "Username",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              cUsername.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "--------",
            ),
          ),
          Center(
            child: Text(
              "Email",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              cEmail.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "--------",
            ),
          ),
          Center(
            child: Text(
              "Full Name",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              cFull_name.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "--------",
            ),
          ),
          Center(
            child: Text(
              "Gender",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              cSex.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "--------",
            ),
          ),
          Center(
            child: Text(
              "Address",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              cAlamat.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      btnOkOnPress: () {},
      btnOkIcon: Icons.check_circle,
    ).show();
  }
}
