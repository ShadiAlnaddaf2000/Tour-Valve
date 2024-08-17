class AllFacilitiesModel {
  String? code;
  String? message;
  Result? result;

  AllFacilitiesModel({this.code, this.message, this.result});

  AllFacilitiesModel.fromJson(Map<String, dynamic> json) {
    code = json["code"] as String?;
    message = json["message"] as String?;
    result = json["result"] != null ? Result.fromJson(json["result"]) : null;
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
    return 'AllFacilitiesModel{code: $code, message: $message, result: $result}';
  }
}

class Result {
  List<Facility>? facilities;

  Result({this.facilities});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["facilities"] is List) {
      facilities = json["facilities"] != null
          ? (json["facilities"] as List)
              .map((e) => Facility.fromJson(e))
              .toList()
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (facilities != null) {
      data["facilities"] = facilities?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Result{facilities: $facilities}';
  }
}

class Facility {
  int? id;
  String? name;
  String? description;
  int? cityId;
  String? cityName;
  String? countryName;
  List<String>? imgs;

  Facility({
    this.id,
    this.name,
    this.description,
    this.cityId,
    this.cityName,
    this.countryName,
    this.imgs,
  });

  Facility.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int?;
    name = json["name"] as String?;
    description = json["description"] as String?;
    cityId = json["city_id"] as int?;
    cityName = json["city_name"] as String?;
    countryName = json["country_name"] as String?;
    if (json["imgs"] is List) {
      imgs = json["imgs"] != null ? List<String>.from(json["imgs"]) : null;
      imgs = imgs?.map(
        (e) {
          // If you have a URL domain to prepend, uncomment the following line
          // return '${Urls.domain}$e';
          return e;
        },
      ).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["city_id"] = cityId;
    data["city_name"] = cityName;
    data["country_name"] = countryName;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }

  @override
  String toString() {
    return 'Facility{id: $id, name: $name, description: $description, cityId: $cityId, cityName: $cityName, countryName: $countryName, imgs: $imgs}';
  }
}
