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

        Container(
          margin: EdgeInsets.only(top: 20, right: 5, left: 5),
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
                    child: SvgPicture.asset(
                      'assets/Paper_light.svg',
                      height: 50,
                    )
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Complains'),
                ],
              ),
              SizedBox(width: 20,),
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
                    child: SvgPicture.asset(
                      'assets/Rupee Sign.svg',
                      height: 50,
                    )
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Bills'),
                ],
              ),
              SizedBox(width: 20,),
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
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Animal',),
                  SizedBox(
                    height: 2,
                  ),
                  Text('Welfare')
                ],
              ),
              SizedBox(width: 20,),
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
                      'assets/Component 8.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Veichle'),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Info'),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
