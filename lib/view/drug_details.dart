// import 'package:drug_house/models/drug_model.dart';
// import 'package:drug_house/provider/drug_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DrugDetails extends StatelessWidget {
//   const DrugDetails({
//     super.key,
//     required this.drug,
//     required this.index,
//   });

//   final Chemicals drug;
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;

//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Hero(
//               tag: Key('default-image-$index'),
//               child: Container(
//                 height: height * 0.4,
//                 width: width,
//                 decoration: const BoxDecoration(
//                     color: Colors.grey,
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/medi.jpg'))),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             drug.name ?? 'Unavailable',
//                             style: const TextStyle(
//                               fontSize: 28.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             drug.molecularFormula ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 24.0,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Consumer<DrugProvider>(
//                           builder: (context, drugProvider, child) {
//                         return IconButton(
//                             onPressed: () {
//                               drugProvider.toggleFavorite(drug.id!);
//                             },
//                             icon: Icon(
//                               drugProvider.isFavorite(drug.id!)
//                                   ? Icons.favorite
//                                   : Icons.favorite_border,
//                               size: 35,
//                               color: const Color.fromARGB(255, 165, 13, 3),
//                             ));
//                       })
//                     ],
//                   ),
//                   const Divider(
//                     indent: 8,
//                     endIndent: 8,
//                     thickness: 2,
//                     height: 25,
//                     color: Color.fromARGB(143, 158, 158, 158),
//                   ),
//                   _buildSection('IUPAC Name', drug.iupacname),
//                   _buildSection('About', drug.about),
//                   _buildSection('Mechanism', drug.mechanism),
//                   _buildSection('Uses', drug.uses),
//                   _buildSection('Effects', drug.effects),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(String title, String? content) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       elevation: 4.0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               content ?? 'N/A',
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:drug_house/models/drug_model.dart';
import 'package:drug_house/provider/drug_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrugDetails extends StatelessWidget {
  const DrugDetails({
    super.key,
    required this.drug,
    required this.index,
  });

  final Chemicals drug;
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 208, 212),
      body: SafeArea(
        top: false,
        child: ListView(
          children: [
            Hero(
              tag: Key('drug-image-$index'),
              child: Container(
                height: height * 0.4,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.shade200,
                      Colors.lightBlueAccent.shade100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/medi.jpg'),
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.lighten),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            drug.name ?? 'Unavailable',
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 1, 44, 80),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            drug.molecularFormula ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Consumer<DrugProvider>(
                          builder: (context, drugProvider, child) {
                        return IconButton(
                          onPressed: () {
                            drugProvider.toggleFavorite(drug.id!);
                          },
                          icon: Icon(
                            drugProvider.isFavorite(drug.id!)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 35,
                            color: drugProvider.isFavorite(drug.id!)
                                ? Colors.redAccent
                                : Colors.grey,
                          ),
                        );
                      }),
                    ],
                  ),
                  const Divider(
                    thickness: 1.5,
                    height: 30,
                    color: Colors.blueGrey,
                  ),
                  _buildSection('IUPAC Name', drug.iupacname),
                  _buildSection('About', drug.about),
                  _buildSection('Mechanism', drug.mechanism),
                  _buildSection('Uses', drug.uses),
                  _buildSection('Effects', drug.effects),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String? content) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5.0,
      shadowColor: Colors.black26,
      color: const Color.fromARGB(255, 208, 214, 216),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 70, 126),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              content ?? 'N/A',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
