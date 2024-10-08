import '../shared/services/remote/end_points.dart';

class AllCountriesModel {
  String? code;
  String? message;
  Result? result;

  AllCountriesModel({this.code, this.message, this.result});

  AllCountriesModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    if (result != null) {
      data["result"] = result?.toJson();
    }
    return data;
  }
}

class Result {
  List<Country>? country;

  Result({this.country});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["country"] is List) {
      country = json["country"] == null
          ? null
          : (json["country"] as List).map((e) => Country.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data["country"] = country?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String? name;
  String? description;
  List<String>? imgs;

  Country({this.name, this.description, this.imgs});

  Country.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["imgs"] is List) {
      imgs = json["imgs"] == null ? null : List<String>.from(json["imgs"]);
      imgs = imgs?.map(
        (e) {
          print('${Urls.domain}$e');
          
          
          return '${Urls.domain}$e';
        },
      ).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["description"] = description;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }
}
