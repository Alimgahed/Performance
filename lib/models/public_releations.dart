import 'dart:convert';

class public_releations {
  String? fromDateToDate;
  int? public_releationsId;
  String? public_releationsName;
  int? public_releationsValue;
  int? userId;
  String? name;

  public_releations({
    this.fromDateToDate,
    this.public_releationsId,
    this.public_releationsName,
    this.public_releationsValue,
    this.userId,
    this.name,
  });

  // Factory method to create a public_releations from JSON
  factory public_releations.fromJson(Map<String, dynamic> json) {
    return public_releations(
      fromDateToDate: json['from_date_to_date'],
      public_releationsId: json['standard_id'],
      public_releationsName: json['standard_name'],
      public_releationsValue: json['standard_value'],
      userId: json['user_id'],
      name: json['name'],
    );
  }

  // Method to convert public_releations to JSON
  Map<String, dynamic> toJson() {
    return {
      'from_date_to_date': fromDateToDate,
      'public_releations_id': public_releationsId,
      'public_releations_name': public_releationsName,
      'public_releations_value': public_releationsValue,
      'user_id': userId,
      'name': name,
    };
  }
}

// Example function to parse the JSON data
List<public_releations> parsepublic_releationss(String jsonData) {
  final List<dynamic> parsedJson = json.decode(jsonData);
  return parsedJson.map((json) => public_releations.fromJson(json)).toList();
}
