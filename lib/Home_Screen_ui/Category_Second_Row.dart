import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySecondRow extends StatefulWidget{
  const CategorySecondRow({super.key});

  @override
  State<CategorySecondRow> createState() {
    return _CategorySecondRowState();
  }

}

class  _CategorySecondRowState extends State<CategorySecondRow>{
  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

        InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Color.fromARGB(52, 0, 126, 253),
          onTap: () {},
          child: Ink(
            height: 68,
            width: 164,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/QUICKComplain.png'),scale: 0.9),
              border: Border.all(
                  color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),


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
      ],
    );
  }


}