import 'package:drug_house/provider/drug_provider.dart';
import 'package:drug_house/widgets/drug_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteDrugs extends StatefulWidget {
  const FavoriteDrugs({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<FavoriteDrugs> createState() => _FavoriteDrugsState();
}

class _FavoriteDrugsState extends State<FavoriteDrugs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 28, 51),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const Text(
                        'Favorite Drugs',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<DrugProvider>(builder: (context, drugProvider, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: drugProvider.favorite.length,
                    itemBuilder: (context, index) {
                      var drug =
                          drugProvider.getById(drugProvider.favorite[index]);
                      return DrugCardWidget(
                        height: widget.height,
                        width: widget.width,
                        drug: drug,
                        drugProvider: drugProvider,
                        index: index,
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    ));
  }

  AppBar newMethod() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Favorite Drugs',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF002D62),
    );
  }
}
