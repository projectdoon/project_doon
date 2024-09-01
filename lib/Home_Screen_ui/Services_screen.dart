import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../servicesScreen/AnimalWelfare.dart';
import '../servicesScreen/allcomplains.dart';
import '../servicesScreen/bills.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() {
    return _ServicesScreenState();
  }
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(context) {
    return SafeArea(

      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text(
                'Services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const allComplain()));
                        },
                        child: Image.asset(
                          'assets/Paper_light@3x.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Complains'),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const bills()));
                          },
                          child: SvgPicture.asset(
                            'assets/Rupee Sign.svg',
                            height: 50,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Bills'),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Animalwelfare()));
                          },
                          child: Image.asset(
                            'assets/Component 7.png',
                            height: 50,
                            width: 50,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Animal\nWelfare',
                        style: TextStyle(fontSize: 12),
                      ),
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
                            'assets/Component 7.png',
                            height: 50,
                            width: 50,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Vehicle Info'),
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
                            'assets/notebook_light.png',
                            height: 50,
                            width: 50,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Gov. Schemes'),
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
                            'assets/Map_light.png',
                            height: 50,
                            width: 50,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Gov. Services',
                        style: TextStyle(fontSize: 12),
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
