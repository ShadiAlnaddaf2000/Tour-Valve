class AllCountriesModel {
  String? code;
  String? message;
  Result? result;

  AllCountriesModel({this.code, this.message, this.result});

  AllCountriesModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(result != null) {
      _data["result"] = result?.toJson();
    }
    return _data;
  }
}

class Result {
  List<Country>? country;

  Result({this.country});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["country"] is List) {
      country = json["country"] == null ? null : (json["country"] as List).map((e) => Country.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(country != null) {
      _data["country"] = country?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Country {
  String? name;
  String? description;
  List<String>? imgs;

  Country({this.name, this.description, this.imgs});

  Country.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["imgs"] is List) {
      imgs = json["imgs"] == null ? null : List<String>.from(json["imgs"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["description"] = description;
    if(imgs != null) {
      _data["imgs"] = imgs;
    }
    return _data;
  }
}