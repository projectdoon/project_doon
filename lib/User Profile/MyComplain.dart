import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import 'package:mydoon/configuration/config.dart';
import '../Home_Screen_ui/home_screen.dart';
import 'package:http/http.dart' as http;

class myComplain extends ConsumerStatefulWidget {
  const myComplain({super.key});

  @override
  ConsumerState<myComplain> createState() {
    return myComplainState();
  }
}

class myComplainState extends ConsumerState<myComplain> {
  late final String? token;
  late String? userId;
  List? items;
  bool _customIcon = false;

  @override
  void initState() {
    token = ref.read(tokenProvider);

    print(token);
    if (token == null || token!.isEmpty) {
      print("❌ Token is null or empty!");
      return;
    }

    try {
      Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token!);
      userId = jwtDecodedToken['_id'];
      getComplainList(userId);
    } catch (e) {
      print("❌ JWT Decoding Error: $e");
    }
  }

  void getComplainList(userId) async {
    var regBody = {"userId": userId};

    try {
      print(userId);
      var response = await http.post(Uri.parse(Config.getComplainData),
          headers: {"content-type": "application/json"},
          body: jsonEncode(regBody));

      print(response.body);
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);
      items = jsonResponse['success'];
      print(items);

      setState(() {});
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  const Expanded(
                    child: Text(
                      'My Complains',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(),
              child: items == null
                  ? null
                  : ListView.builder(
                      itemCount: items!.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 0,
                              child: Column(
                                children: [
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent,
                                        splashColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        radius: 12,
                                      ),
                                      title: Text(
                                        '${items![index]['Category']}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onExpansionChanged: (bool expanded) {
                                        setState(() => _customIcon = expanded);
                                      },
                                      trailing: const Icon(Icons.dehaze_sharp),
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                              '${items![index]['Description']}'),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    elevation: 3,
                                                    minimumSize:
                                                        const Size(60, 24),
                                                    backgroundColor:
                                                        Colors.blue),
                                                child: const Text(
                                                  'Solved',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  elevation: 3,
                                                  minimumSize:
                                                      const Size(60, 24),
                                                  backgroundColor:
                                                      Colors.white),
                                              child: const Text(
                                                'Re-Complain',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //
                                  //     Container(
                                  //
                                  //       child: ElevatedButton(
                                  //         onPressed: () {},
                                  //         child: Text('Solved',style: TextStyle(color: Colors.white),),
                                  //         style: ElevatedButton.styleFrom(
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(5.0),
                                  //           ),
                                  //           elevation: 3,
                                  //           minimumSize: Size(60, 24),
                                  //           backgroundColor: Colors.blue
                                  //         ),
                                  //       ),
                                  //       margin: EdgeInsets.only(left: 20),
                                  //     ),
                                  //     SizedBox(width: 10,),
                                  //     ElevatedButton(
                                  //       onPressed: () {},
                                  //       child: Text('Re-Complain',style: TextStyle(color: Colors.black),),
                                  //       style: ElevatedButton.styleFrom(
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //             BorderRadius.circular(5.0),
                                  //           ),
                                  //           elevation: 3,
                                  //           minimumSize: Size(60, 24),
                                  //           backgroundColor: Colors.white
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ))
          ],
        ),
      ),
    );
  }
}
