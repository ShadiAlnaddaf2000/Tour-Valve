class FinanceDataModel {
  String? message;
  FinanceResult? result;

  FinanceDataModel({this.message, this.result});

  FinanceDataModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["result"] is Map) {
      result = json["result"] == null
          ? null
          : FinanceResult.fromJson(json["result"]);
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
    return 'FinanceDataModel{message: $message, result: $result}';
  }
}

class FinanceResult {
  List<FinanceTransaction>? transactions;

  FinanceResult({this.transactions});

  FinanceResult.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      transactions = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => FinanceTransaction.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transactions != null) {
      data["data"] = transactions?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'FinanceResult{transactions: $transactions}';
  }
}

class FinanceTransaction {
  int? id;
  int? amount;
  int? before;
  int? after;
  String? type;
  String? description;
  String? date;

  FinanceTransaction(
      {this.id,
      this.amount,
      this.before,
      this.after,
      this.type,
      this.description,
      this.date});

  FinanceTransaction.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["amount"] is int) {
      amount = json["amount"];
    }
    if (json["before"] is int) {
      before = json["before"];
    }
    if (json["after"] is int) {
      after = json["after"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["amount"] = amount;
    data["before"] = before;
    data["after"] = after;
    data["type"] = type;
    data["description"] = description;
    data["date"] = date;
    return data;
  }

  @override
  String toString() {
    return 'FinanceTransaction{id: $id, amount: $amount, before: $before, after: $after, type: $type, description: $description, date: $date}';
  }
}
