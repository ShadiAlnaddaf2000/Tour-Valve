import '../shared/services/remote/end_points.dart';

class AllTripsModel {
  String? code;
  String? message;
  Result? result;

  AllTripsModel({this.code, this.message, this.result});

  AllTripsModel.fromJson(Map<String, dynamic> json) {
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
  List<Trip>? trips;

  Result({this.trips});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["trips"] is List) {
      trips = json["trips"] == null
          ? null
          : (json["trips"] as List).map((e) => Trip.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trips != null) {
      data["trips"] = trips?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Trip {
  String? tripName;
  String? description;
  int? cost;
  String? startingDate;
  String? endingDate;
  String? userName;
  int? currentNumber;
  List<String>? imgs;

  Trip({
    this.tripName,
    this.description,
    this.cost,
    this.startingDate,
    this.endingDate,
    this.userName,
    this.currentNumber,
    this.imgs
  });

  Trip.fromJson(Map<String, dynamic> json) {
    if (json["trip_name"] is String) {
      tripName = json["trip_name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["cost"] is int) {
      cost = json["cost"];
    }
    if (json["starting_date"] is String) {
      startingDate = json["starting_date"];
    }
    if (json["ending_date"] is String) {
      endingDate = json["ending_date"];
    }
    if (json["user_name"] is String) {
      userName = json["user_name"];
    }
    if (json["current_number"] is int) {
      currentNumber = json["current_number"];
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
    data["trip_name"] = tripName;
    data["description"] = description;
    data["cost"] = cost;
    data["starting_date"] = startingDate;
    data["ending_date"] = endingDate;
    data["user_name"] = userName;
    data["current_number"] = currentNumber;
    if (imgs != null) {
      data["imgs"] = imgs;
    }
    return data;
  }
}
