import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            ),
            Container(
              margin: EdgeInsets.only(top: 44,right: 28,left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          height: 68,
                          width: 68,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/Paper_light@3x.png'),
                                scale: 2.7),
                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          height: 68,
                          width: 68,
                          child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: SvgPicture.asset(
                                'assets/Rupee Sign.svg',
                                height: 5,
                              )),
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Bills'),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          height: 68,
                          width: 68,
                          child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: SvgPicture.asset(
                                'assets/Rupee Sign.svg',
                                height: 5,
                              )),
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Animal\nWelfare',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 44,right: 28,left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: SvgPicture.asset(
                                'assets/Component 8.svg',
                                height: 5,
                              )),
                          height: 68,
                          width: 68,
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          height: 68,
                          width: 68,
                          child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: SvgPicture.asset(
                                'assets/notebook_light.svg',
                                height: 5,
                              )),
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Bills'),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Color.fromARGB(50, 255, 255, 255),
                        onTap: () {},
                        child: Ink(
                          height: 68,
                          width: 68,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: SvgPicture.asset(
                                'assets/Map_light.svg',
                                height: 5,
                              )),
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Color.fromARGB(255, 58, 129, 241),
                                width: 1.5),
                            color: const Color.fromARGB(255, 176, 205, 249),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Animal\nWelfare',
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
