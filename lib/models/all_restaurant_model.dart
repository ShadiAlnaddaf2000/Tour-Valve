import '../shared/services/remote/end_points.dart';

class AllRestaurantsModel {
  String? code;
  String? message;
  Result? result;

  AllRestaurantsModel({this.code, this.message, this.result});

  AllRestaurantsModel.fromJson(Map<String, dynamic> json) {
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
  List<Restaurant>? restaurants;

  Result({this.restaurants});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["country"] is List) {
      restaurants = json["country"] == null
          ? null
          : (json["country"] as List)
              .map((e) => Restaurant.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (restaurants != null) {
      data["country"] = restaurants?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? description;
  String? foodType;
  int? cityId;
  String? cityName;
  String? countryName;
  List<String>? imgs;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.foodType,
      this.cityId,
      this.cityName,
      this.countryName,
      this.imgs});

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["food_type"] is String) {
      foodType = json["food_type"];
    }
    if (json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if (json["city_name"] is String) {
      cityName = json["city_name"];
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
    data["food_type"] = foodType;
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
    return 'Restaurant{id: $id, name: $name, description: $description, foodType: $foodType, cityId: $cityId, cityName: $cityName, countryName: $countryName, imgs: $imgs}';
  }
}
