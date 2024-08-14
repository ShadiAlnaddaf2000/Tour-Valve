import '../shared/services/remote/end_points.dart';

class AllHotelsModel {
  String? code;
  String? message;
  Result? result;

  AllHotelsModel({this.code, this.message, this.result});

  AllHotelsModel.fromJson(Map<String, dynamic> json) {
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
  List<Hotel>? hotels;

  Result({this.hotels});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["hotels"] is List) {
      hotels = json["hotels"] == null
          ? null
          : (json["hotels"] as List).map((e) => Hotel.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotels != null) {
      data["hotels"] = hotels?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Hotel {
  String? name;
  String? description;
  String? availability;
  String? cityName;
  String? countryName;
  List<String>? imgs;

  Hotel({this.name, this.description, this.availability, this.cityName, this.countryName, this.imgs});

  Hotel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["availability"] is String) {
      availability = json["availability"];
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
    data["name"] = name;
    data["description"] = description;
    data["availability"] = availability;
    data["city_name"] = cityName;
    data["country_name"] = countryName;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }
}
