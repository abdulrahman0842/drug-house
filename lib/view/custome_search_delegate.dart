import 'package:drug_house/models/drug_model.dart';
import 'package:drug_house/provider/drug_provider.dart';
import 'package:drug_house/widgets/drug_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Chemicals> chemical;

  CustomSearchDelegate(this.chemical);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    DrugProvider drugProvider = context.read<DrugProvider>();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    List result = chemical
        .where((element) => element.name!
            .toLowerCase()
            .contains(query.replaceAll(RegExp(r'\s+'), '').toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return DrugCardWidget(
            index: index,
            height: height,
            width: width,
            drug: result[index],
            drugProvider: drugProvider,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestions = chemical
        .where((element) => element.name!
            .toLowerCase()
            .contains(query.replaceAll(RegExp(r'\s+'), '').toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              query = suggestions[index].name ?? '';
            },
            title: Text(suggestions[index].name ?? 'N/A'),
          );
        });
  }
}
