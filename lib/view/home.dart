import 'dart:math';

import 'package:drug_house/models/drug_model.dart';
import 'package:drug_house/provider/drug_provider.dart';
import 'package:drug_house/view/custome_search_delegate.dart';
import 'package:drug_house/view/favorite.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/drug_card_widget.dart';
import '../widgets/featured_drug_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<DrugModel> _drugModel;

  @override
  void initState() {
    super.initState();
    context.read<DrugProvider>();
    _drugModel = context.read<DrugProvider>().parseJson();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 28, 51),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<DrugModel>(
              future: _drugModel,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.data == null &&
                    snapshot.data!.chemicals!.isEmpty) {
                  return const Center(
                    child: Text('No Drug Data available'),
                  );
                } else {
                  int randomIndex =
                      Random().nextInt(snapshot.data!.chemicals!.length);
                  Chemicals featuredDrug =
                      snapshot.data!.chemicals![randomIndex];
                  return Column(
                    children: [
                      customAppBar(height, width, context),
                      FeaturedDrugCard(
                        height: height,
                        featuredDrug: featuredDrug,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.chemicals!.length,
                            itemBuilder: (context, index) {
                              var drug = snapshot.data!.chemicals![index];
                              return Consumer<DrugProvider>(
                                builder: ((context, drugProvider, child) {
                                  return DrugCardWidget(
                                      index: index,
                                      height: height,
                                      width: width,
                                      drug: drug,
                                      drugProvider: drugProvider);
                                }),
                              );
                            }),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    ));
  }

  SizedBox customAppBar(double height, double width, BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Drug House',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: width * 0.2,
          ),
          IconButton(
            onPressed: () async {
              final snapShot = await _drugModel;
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(snapShot.chemicals ?? []),
              );
            },
            icon: const Icon(Icons.search, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteDrugs(
                    height: height,
                    width: width,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.white,
              semanticLabel: 'Favorite',
            ),
          ),
        ],
      ),
    );
  }
}
