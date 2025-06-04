import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryPublicAmenities extends StatefulWidget {
  const CategoryPublicAmenities({super.key});

  @override
  State<CategoryPublicAmenities> createState() =>
      _CategoryPublicAmenitiesState();
}

class _CategoryPublicAmenitiesState extends State<CategoryPublicAmenities> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                constraints:
                    const BoxConstraints.tightFor(width: 127, height: 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 58, 129, 241),
                    width: 1.5,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 211, 227, 251),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedAudit01,
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
                'Water ATM',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                constraints:
                    const BoxConstraints.tightFor(width: 127, height: 42),
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
                      26, // You might need to explicitly pass size if HugeIcon supports it
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Public Toilets',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                constraints:
                const BoxConstraints.tightFor(width: 127, height: 42),
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
                  26, // You might need to explicitly pass size if HugeIcon supports it
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Public Toilets',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                constraints:
                const BoxConstraints.tightFor(width: 127, height: 42),
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
                  26, // You might need to explicitly pass size if HugeIcon supports it
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Public Toilets',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
