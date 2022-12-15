import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odev/not/not.dart';
import 'package:odev/servisler/auth.dart';

class postcard extends StatefulWidget {
  final snap;
  const postcard({
    super.key,
    required this.snap,
  });

  @override
  State<postcard> createState() => _postcardState();
}

class _postcardState extends State<postcard> {
  authservisi _auth = authservisi();
  deletePost(String postId) async {
    try {
      await _auth.deletePost(postId);
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => notekran(
                      notadi: widget.snap['notadi'],
                      not: widget.snap['not'],
                    )));
      },
      child: Container(
        // boundary needed for web
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            // HEADER SECTION OF THE POST
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ).copyWith(right: 0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => notekran(
                                                    notadi:
                                                        widget.snap['notadi'],
                                                    not: widget.snap['not'],
                                                  )));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          80,
                                      child: RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text:
                                                    ' ${widget.snap['notadi']}',
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        useRootNavigator: false,
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: ListView(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                                shrinkWrap: true,
                                                children: [
                                                  'Delete',
                                                ]
                                                    .map(
                                                      (e) => InkWell(
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        12,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(e),
                                                          ),
                                                          onTap: () {
                                                            deletePost(
                                                              widget.snap[
                                                                      'postId']
                                                                  .toString(),
                                                            );
                                                            // remove the dialog box
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }),
                                                    )
                                                    .toList()),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.more_vert),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
