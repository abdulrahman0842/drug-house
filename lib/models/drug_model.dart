class DrugModel {
  List<Chemicals>? chemicals;

  DrugModel({this.chemicals});

  DrugModel.fromJson(Map<String, dynamic> json) {
    if (json['chemicals'] != null) {
      chemicals = <Chemicals>[];
      json['chemicals'].forEach((v) {
        chemicals!.add(Chemicals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chemicals != null) {
      data['chemicals'] = chemicals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chemicals {
  int? id;
  String? name;
  String? image;
  String? molecularFormula;
  String? iupacname;
  String? about;
  String? mechanism;
  String? uses;
  String? effects;

  Chemicals(
      {this.id,
      this.name,
      this.image,
      this.molecularFormula,
      this.iupacname,
      this.about,
      this.mechanism,
      this.uses,
      this.effects});

  Chemicals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    molecularFormula = json['molecularFormula'];
    iupacname = json['iupacname'];
    about = json['about'];
    mechanism = json['mechanism'];
    uses = json['uses'];
    effects = json['effects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['molecularFormula'] = molecularFormula;
    data['iupacname'] = iupacname;
    data['about'] = about;
    data['mechanism'] = mechanism;
    data['uses'] = uses;
    data['effects'] = effects;
    return data;
  }
}
