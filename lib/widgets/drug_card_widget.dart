import 'package:flutter/material.dart';
import 'package:drug_house/models/drug_model.dart';
import 'package:drug_house/provider/drug_provider.dart';
import 'package:drug_house/view/drug_details.dart';

class DrugCardWidget extends StatelessWidget {
  const DrugCardWidget({
    super.key,
    required this.index,
    required this.height,
    required this.width,
    required this.drug,
    required this.drugProvider,
  });

  final int index;
  final double height;
  final double width;
  final Chemicals drug;
  final DrugProvider drugProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DrugDetails(
                      drug: drug,
                      index: index,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 5,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 28, 51),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: Key('drug-image-$index'),
                child: Container(
                  height: height * 0.15,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: const Color.fromARGB(255, 16, 28, 48)),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/medi.jpg'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  drug.name ?? 'Unavailable',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 28, 51),
                                      overflow: TextOverflow.ellipsis),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  drug.molecularFormula ?? 'Unavailable',
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade700,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              drugProvider.toggleFavorite(drug.id!);
                            },
                            icon: Icon(
                              drugProvider.isFavorite(drug.id!)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: drugProvider.isFavorite(drug.id!)
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        drug.about ?? 'Unavailable',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
