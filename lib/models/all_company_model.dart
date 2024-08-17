import '../shared/services/remote/end_points.dart';

class AllCompaniesModel {
  String? code;
  String? message;
  Result? result;

  AllCompaniesModel({this.code, this.message, this.result});

  AllCompaniesModel.fromJson(Map<String, dynamic> json) {
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
    return 'AllCompaniesModel{code: $code, message: $message, result: $result}';
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
  String? transportType;
  int? price;
  List<String>? imgs;

  Facility(
      {this.id,
      this.name,
      this.description,
      this.transportType,
      this.price,
      this.imgs});

  Facility.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int?;
    name = json["name"] as String?;
    description = json["description"] as String?;
    transportType = json["transport_type"] as String?;
    price = json["price"] as int?;
    if (json["imgs"] is List) {
      imgs = json["imgs"] != null ? List<String>.from(json["imgs"]) : null;
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
    data["transport_type"] = transportType;
    data["price"] = price;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }

  @override
  String toString() {
    return 'Facility{id: $id, name: $name, description: $description, transportType: $transportType, price: $price, imgs: $imgs}';
  }
}
