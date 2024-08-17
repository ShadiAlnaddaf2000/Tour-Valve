import '../shared/services/remote/end_points.dart';

class AllCitiesModel {
  String? code;
  String? message;
  Result? result;

  AllCitiesModel({this.code, this.message, this.result});

  AllCitiesModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    } else if (json["code"] is int) {
      code = json["code"].toString();
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

  @override
  String toString() {
    return 'AllCitiesModel{code: $code, message: $message, result: $result}';
  }
}

class Result {
  List<City>? cities;

  Result({this.cities});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["cities"] is List) {
      cities = json["cities"] == null
          ? null
          : (json["cities"] as List).map((e) => City.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data["cities"] = cities?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Result{cities: $cities}';
  }
}

class City {
  int? id;
  String? name;
  String? description;
  int? countryId;
  String? countryName;
  List<String>? imgs;

  City({
    this.id,
    this.name,
    this.description,
    this.countryId,
    this.countryName,
    this.imgs,
  });

  City.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["country_id"] is int) {
      countryId = json["country_id"];
    }
    if (json["country_name"] is String) {
      countryName = json["country_name"];
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
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["country_id"] = countryId;
    data["country_name"] = countryName;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }

  @override
  String toString() {
    return 'City{id: $id, name: $name, description: $description, countryId: $countryId, countryName: $countryName, imgs: $imgs}';
  }
}
