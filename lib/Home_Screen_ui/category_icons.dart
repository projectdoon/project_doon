import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Complains/complainExpanded.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => complainExpanded()),
                );
              },
              child: Ink(

                height: 68,
                width: 68,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/Paper_light@3x.png'),
                      scale: 2.7),
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
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
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
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
                      'assets/notebook_light.svg',

                    )),
                decoration: BoxDecoration(

                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
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
                      'assets/Component 8.svg',

                    )),

                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 176, 205, 249),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Vehicle\n   info',
              style: TextStyle(fontSize: 12),
            ),

          ],
        ),
      ],
    );
  }
}
