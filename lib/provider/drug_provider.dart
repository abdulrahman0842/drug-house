import 'dart:convert';
import 'package:drug_house/models/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrugProvider with ChangeNotifier {
  late DrugModel drugs;
  final List<int> _favorite = [];
  List<int> get favorite => _favorite;
  SharedPreferences? preferences;

  DrugProvider() {
    _init();
  }

  Future<void> _init() async {
    preferences = await SharedPreferences.getInstance();
    getidSharedPref();
  }

  Future<DrugModel> parseJson() async {
    try {
      final jsonData =
          await rootBundle.loadString('assets/data/chemicals.json');
      var jsonDecoded = json.decode(jsonData);
      drugs = DrugModel.fromJson(jsonDecoded);
      return drugs;
    } catch (e) {
      throw Exception(e);
    }
  }

  void storeFavIdSharedPref(List<int> drugIDs) async {
    String drugIDsString = drugIDs.join(',');
    await preferences?.setString('favorite', drugIDsString);
  }

  void getidSharedPref() {
    String? drugIDString = preferences?.getString('favorite');
    if (drugIDString != null && drugIDString.isNotEmpty) {
      try {
        _favorite.clear();
        _favorite.addAll(
            drugIDString.split(',').map((id) => int.parse(id)).toList());
        notifyListeners();
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Chemicals getById(int id) {
    return drugs.chemicals!.firstWhere((chemical) => chemical.id == id);
  }

  void toggleFavorite(int id) {
    if (_favorite.contains(id)) {
      _favorite.remove(id);
    } else {
      _favorite.add(id);
    }

    storeFavIdSharedPref(_favorite);
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _favorite.contains(id);
  }
}
