import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryIcons extends StatefulWidget {
  const CategoryIcons({super.key});

  @override
  State<CategoryIcons> createState() {
    return _CategoryIconsState();
  }
}

class _CategoryIconsState extends State<CategoryIcons> {
  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      image: AssetImage('assets/Paper_light@3x.png'),scale: 2.7),
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 176, 205, 249),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

            ),
            SizedBox(height: 8,),
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
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/Rupee Sign.png'),scale: 0.9),
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 176, 205, 249),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8,),
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
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/Component 7.png'),scale: 1),
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 176, 205, 249),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text('Animal\nWelfare',style: TextStyle(fontSize: 12),),
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
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/Component 8.png'),scale: 0.95),
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 176, 205, 249),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text('Vehicle\n   info',style: TextStyle(fontSize: 12),),
          ],
        ),
      ],
    );
  }
}
