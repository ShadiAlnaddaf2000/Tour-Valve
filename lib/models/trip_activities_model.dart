class TripActivitiesModel {
  String? code;
  String? message;
  Result? result;

  TripActivitiesModel({this.code, this.message, this.result});

  TripActivitiesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'TripActivityModel{code: $code, message: $message, result: $result}';
  }
}

class Result {
  int? id;
  String? tripName;
  String? restaurantName;
  String? hotelName;
  String? transportName;
  String? facilityName;

  Result({
    this.id,
    this.tripName,
    this.restaurantName,
    this.hotelName,
    this.transportName,
    this.facilityName,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    restaurantName = json['restaurant_name'];
    hotelName = json['hotel_name'];
    transportName = json['transport_name'];
    facilityName = json['facility_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_name'] = tripName;
    data['restaurant_name'] = restaurantName;
    data['hotel_name'] = hotelName;
    data['transport_name'] = transportName;
    data['facility_name'] = facilityName;
    return data;
  }

  @override
  String toString() {
    return 'Result{id: $id, tripName: $tripName, restaurantName: $restaurantName, hotelName: $hotelName, transportName: $transportName, facilityName: $facilityName}';
  }
}
