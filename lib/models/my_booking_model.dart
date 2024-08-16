class UserTripsModel {
  String? message;
  Result? result;

  UserTripsModel({this.message, this.result});

  UserTripsModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    if (result != null) {
      data["result"] = result?.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'UserTripsModel{message: $message, result: $result}';
  }
}

class Result {
  List<Trip>? trips;

  Result({this.trips});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      trips = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Trip.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trips != null) {
      data["data"] = trips?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Result{trips: $trips}';
  }
}

class Trip {
  int? id;
  String? tripName;
  double? cost;
  int? personNumber;
  double? totalPrice;
  String? createDate;

  Trip(
      {this.id,
      this.tripName,
      this.cost,
      this.personNumber,
      this.totalPrice,
      this.createDate});

  Trip.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["trip_name"] is String) {
      tripName = json["trip_name"];
    }
    if (json["cost"] is double || json["cost"] is int) {
      cost = json["cost"].toDouble();
    }
    if (json["person_number"] is int) {
      personNumber = json["person_number"];
    }
    if (json["total_price"] is double || json["total_price"] is int) {
      totalPrice = json["total_price"].toDouble();
    }
    if (json["created_at"] is String) {
      createDate = json["created_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["trip_name"] = tripName;
    data["cost"] = cost;
    data["person_number"] = personNumber;
    data["total_price"] = totalPrice;
    return data;
  }

  @override
  String toString() {
    return 'Trip{id: $id, tripName: $tripName, cost: $cost, personNumber: $personNumber, totalPrice: $totalPrice , createDate: $createDate}';
  }
}
