import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
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
      padding: const EdgeInsets.only(left: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Govtschemes()));
                },
                constraints:
                    const BoxConstraints.tightFor(width: 55, height: 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 58, 129, 241),
                    width: 1.5,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 211, 227, 251),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedTrafficLight,
                  color: Colors.black,
                  size:
                      26,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Traffic Info',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

          Column(
            children: [
              RawMaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => const DragList(),
                  );
                },
                constraints: const BoxConstraints.tightFor(width: 146, height: 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 58, 129, 241),
                    width: 1.5,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                elevation: 4, // for shadow, optional
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/QUICKComplain.svg',
                  ),
                ),
              )

            ],
          ),

          Column(
            children: [

              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GovServices()));
                },
                constraints:
                    const BoxConstraints.tightFor(width: 55, height: 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 58, 129, 241),
                    width: 1.5,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 211, 227, 251),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedRealEstate02,
                  color: Colors.black,
                  size:
                      26,
                ),
              ),

              const SizedBox(
                height: 8,
              ),
              const Text(
                'Property Tax',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
