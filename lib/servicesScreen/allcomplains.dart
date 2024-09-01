import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class allComplain extends StatefulWidget {
  const allComplain({super.key});

  @override
  State<allComplain> createState() => _allComplainState();
}

class _allComplainState extends State<allComplain> {
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
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01),
                  Expanded(
                    child: Text(
                      'All Complain',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.02), // Equal spacing on the right
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 44, right: 28, left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 3.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Garbage Vehicle'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 11.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Dead Animal'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 3.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Open Manhole'),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 44, right: 28, left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 3.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Water Leakage'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 12.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Public Toilet'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/wave 1.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Stagnant Water'),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 44, right: 28, left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Road_alt_fill.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Road Repair'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 14.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Public Transport'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Component 15.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Street Light'),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 44, right: 28, left: 28),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the single Column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 176, 205, 249),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 58, 129, 241),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {},
                        child: Image.asset(
                          'assets/Add_round.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Other'),
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
