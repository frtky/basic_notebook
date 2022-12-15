import 'package:flutter/material.dart';

class notekran extends StatefulWidget {
  final String notadi;
  final String not;

  const notekran({super.key, required this.notadi, required this.not});

  @override
  State<notekran> createState() => _notekranState();
}

class _notekranState extends State<notekran> {
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
                  text: 'LAR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: false,
        actions: <Widget>[],
      ),
      // POST FORM
      body: Column(
        children: <Widget>[
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 20,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: ' ${widget.notadi}',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          const Divider(
            color: Colors.black,
            indent: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: ' ${widget.not}',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
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
