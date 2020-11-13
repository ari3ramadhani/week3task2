import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week3task2/api.dart';
import 'dart:convert';

import 'package:week3task2/main.dart';


class PageRegister extends StatefulWidget {
  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cFullName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cAlamat = TextEditingController();

//deklarasi untuk masing-masing widget
  String nUsername, nFullName, nEmail, nPassword, nAlamat;
  String sex = "";

//menambahkan key form
  final _keyForm = GlobalKey<FormState>();

  void pilihSex(String value) {
    setState(() {
      sex = value;
    });
  }

// saat user klik tombol register
  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataRegister();
    }
  }

  // submit data register
  submitDataRegister() async {
    final responseData = await http
        .post(GetLinknya.linknya+"register.php", body: {
      "username": nUsername,
      "full_name": nFullName,
      "email": nEmail,
      "password": nPassword,
      "sex": sex,
      "alamat": nAlamat
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Register Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'gambar/kesehatan.png',
              height: 120.0,
              width: 120.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cUsername,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input UserName';
                  }
                  return null;
                },
                onSaved: (value) => nUsername = cUsername.text,
                decoration: InputDecoration(
                    hintText: 'username',
                    labelText: 'Input usermame',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                      BorderSide(color: Colors.lightGreen, width: 2.5),
                    )),

              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cFullName,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Full Name';
                  }
                  return null;
                },
                onSaved: (value) => nFullName = cFullName.text,
                decoration: InputDecoration(
                    hintText: 'Fullname',
                    labelText: 'Input Full Name',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                      BorderSide(color: Colors.lightGreen, width: 2.5),
                    )),

              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cEmail,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Email';
                  }
                  return null;
                },
                onSaved: (value) => nEmail = cEmail.text,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Input Email',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                      BorderSide(color: Colors.lightGreen, width: 2.5),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: cPassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Input Password';
                  }
                  return null;
                },
                onSaved: (value) => nPassword = cPassword.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Input Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                      BorderSide(color: Colors.lightGreen, width: 2.5),
                    )),

              ),
            ),
//radio button
            Padding(
              padding: EdgeInsets.all(10),
              child: RadioListTile(
                value: "Laki-laki",
                title: Text('Laki-laki',style: TextStyle(color: Colors.black),),
                groupValue: sex,
                onChanged: (String value) {
                  pilihSex(value);
                },
                activeColor: Colors.green,
                selected: true,
                subtitle: Text('Pilih ini jika laki-laki'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RadioListTile(
                value: "Perempuan",
                title: Text('Perempuan',style: TextStyle(color: Colors.black),),
                groupValue: sex,
                onChanged: (String value) {
                  pilihSex(value);
                },
                activeColor: Colors.green,
                subtitle: Text('Pilih ini jika perempuan'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cAlamat,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Alamat';
                  }
                  return null;
                },
                maxLines: 3,
                onSaved: (value) => nAlamat = cAlamat.text,
                decoration: InputDecoration(
                    hintText: 'Alamat',
                    labelText: 'Input Alamat',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                      BorderSide(color: Colors.lightGreen, width: 2.5),
                    )),

              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.green,
                elevation: 5,
                height: 35,
                textColor: Colors.white,
                child: Text('Register',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  setState(() {
                    checkForm();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
              child: MaterialButton(
                textColor: Colors.redAccent,
                child: Text('Sudah Punya Akun ? Silahkan Login',style: TextStyle(fontSize: 15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
