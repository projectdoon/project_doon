import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydoon/Home_Screen_ui/Complains/quickDraglist.dart';

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
      crossAxisAlignment:  CrossAxisAlignment.start,
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
                          'assets/notebook_light.svg',

                        )),
                    height: 68,
                    width: 68,
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
                Text('    Gov\nScheme'),
              ],
            ),

        Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Color.fromARGB(52, 0, 126, 253),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => DragList(),
                );
              },
              child: Ink(
                child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SvgPicture.asset(
                      'assets/QUICKComplain.svg',

                    )),
                height: 68,
                width: 164,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                      color: Color.fromARGB(255, 58, 129, 241), width: 1.5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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

                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SvgPicture.asset(
                      'assets/Map_light.svg',

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
            Text('    Gov\nServices'),
          ],
        ),
      ],
    );
  }


}