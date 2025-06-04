import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

import '../Screens/GovtSchemes.dart';
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
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const complainExpanded(),
                  ),
                );
              },
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedFile01,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Complains',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedBulbCharging,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Electricity\nBill',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedDroplet,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Water Bill',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedInvoice01,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Challans',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}
