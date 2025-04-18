import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydoon/Home_Screen_ui/Complains/quickDraglist.dart';
import 'package:mydoon/Screens/GovtSchemes.dart';
import 'package:mydoon/scheme.dart';
import 'package:mydoon/services_gov.dart';

class CategorySecondRow extends StatefulWidget {
  const CategorySecondRow({super.key});

  @override
  State<CategorySecondRow> createState() {
    return _CategorySecondRowState();
  }
}

class _CategorySecondRowState extends State<CategorySecondRow> {
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15,left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Govtschemes())),
                  child: SvgPicture.asset(
                    'assets/notebook_light.svg',
                    height: 50,
                  )),
              SizedBox(
                height: 8,
              ),
              Text('   Gov\nScheme',style: TextStyle(fontSize: 12),),
            ],
          ),
          SizedBox(
            width: 5,
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => DragList(),
                  );
                },
                child: Ink(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          SizedBox(
            width: 5,
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GovServices())),
                  child: SvgPicture.asset(
                    'assets/Map_light.svg',
                    height: 50,
                  )),
              SizedBox(
                height: 8,
              ),
              Text('    Gov\nServices',style: TextStyle(fontSize: 12),),
            ],
          ),
        ],
      ),
    );
  }
}
