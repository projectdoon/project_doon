import 'package:flutter/material.dart';

class Animalwelfare extends StatefulWidget {
  const Animalwelfare({super.key});

  @override
  State<Animalwelfare> createState() => _AnimalwelfareState();
}

class _AnimalwelfareState extends State<Animalwelfare> {
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
                      'Animal Welfare',
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
                          'assets/dog 2 (1).png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Animal Rescue'),
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
                          'assets/Component 16.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Pet Registration'),
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
                          'assets/Component 17.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('NGO'),
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
