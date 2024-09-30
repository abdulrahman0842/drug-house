import 'package:drug_house/models/drug_model.dart';
import 'package:drug_house/view/drug_details.dart';
import 'package:flutter/material.dart';

class FeaturedDrugCard extends StatelessWidget {
  const FeaturedDrugCard({
    super.key,
    required this.height,
    required this.featuredDrug,
  });

  final double height;
  final Chemicals featuredDrug;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DrugDetails(drug: featuredDrug, index: -1),
              ));
        },
        child: Stack(
          children: [
            Hero(
              tag: const Key('drug-image-${-1}'),
              child: Container(
                  height: height * 0.20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/medi.jpg')))),
            ),
            Container(
                height: height * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(134, 174, 174, 179))),
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                featuredDrug.name ?? 'Null',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              left: 10,
              top: 35,
              child: Text(
                featuredDrug.iupacname ?? 'Null',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              left: 10,
              top: 65,
              child: SizedBox(
                width: 300,
                child: Text(
                  featuredDrug.about ?? 'Null',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
