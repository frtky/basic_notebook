import 'package:flutter/material.dart';
import 'package:odev/anasayfa/anasayfa.dart';
import 'package:odev/kayit/kayit.dart';
import 'package:odev/servisler/auth.dart';

class girisekran extends StatefulWidget {
  const girisekran({super.key});

  @override
  State<girisekran> createState() => _girisekranState();
}

class _girisekranState extends State<girisekran> {
  authservisi _autservisi = authservisi();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
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
                              text: ' DEF',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'TE',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'Rİ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _email,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "email",
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "password",
                                    suffixIcon: const Icon(
                                      Icons.password,
                                      color: Colors.black54,
                                    ),
                                    // icon: Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(
                          context,
                        ).size.width,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blue,
                              Colors.lightBlue,
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            _autservisi
                                .giris(_email.toString(), _password.toString())
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => anasayfaekran(
                                              uid: value!.uid,
                                            ))));
                          },
                          child: const Text(
                            'GİRİŞ YAPIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => kayitekran()));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          padding: EdgeInsets.all(
                            15,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'HALA BİR HESABINIZ YOK MU ?',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'KAYIT OL',
                                style: TextStyle(
                                  color: Color(
                                    0xFF0389F6,
                                  ),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
