import 'package:flutter/material.dart';
import 'package:odev/anasayfa/anasayfa.dart';
import 'package:odev/servisler/auth.dart';

class notekle_ekran extends StatefulWidget {
  final String uid;
  const notekle_ekran({super.key, required this.uid});

  @override
  State<notekle_ekran> createState() => _notekle_ekranState();
}

class _notekle_ekranState extends State<notekle_ekran> {
  authservisi _autservisi = authservisi();
  TextEditingController _not = TextEditingController();
  TextEditingController _notadi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'N',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlue,
              ),
              children: [
                TextSpan(
                  text: 'O',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'T',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: ' EK',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'LE',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _autservisi.Post(_notadi.text, _not.text)
                  .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => anasayfaekran(
                                uid: widget.uid,
                              ))));
            },
            child: const Text(
              "Post",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      // POST FORM
      body: Column(
        children: <Widget>[
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            child: TextField(
              controller: _notadi,
              decoration: InputDecoration(
                  hintText: "not adi", border: InputBorder.none),
              maxLines: 20,
              maxLength: 60,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.65,
                child: TextField(
                  controller: _not,
                  decoration: InputDecoration(
                      hintText: "not...", border: InputBorder.none),
                  maxLines: 20,
                  maxLength: 400,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
