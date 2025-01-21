// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

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

class ValueItem {
  final int indexValue;
  final DateTime date;
  final int userId;
  final int indexPeriod;
  final int estimated;

  ValueItem({
    required this.indexValue,
    required this.date,
    required this.userId,
    required this.indexPeriod,
    required this.estimated,
  });

  // Factory constructor for creating a ValueItem from JSON
  factory ValueItem.fromJson(Map<String, dynamic> json) {
    return ValueItem(
      estimated: json['estimated_value'],
      indexValue: json['index_value'],
      date: DateTime.parse(json['date']),
      userId: json['user_id'],
      indexPeriod: json['index_period'],
    );
  }

  // Method for converting the ValueItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'estimated_value': estimated,
      'index_value': indexValue,
      'date': date.toIso8601String(),
      'user_id': userId,
      'index_period': indexPeriod,
    };
  }
}

class IndexData {
  final int depId;
  final int indexId;
  final List<ValueItem> values;
  final String indexName;
  final String indexType;

  static var obs;

  IndexData({
    required this.depId,
    required this.indexId,
    required this.values,
    required this.indexName,
    required this.indexType,
  });

  // Factory constructor for creating an IndexData instance from JSON
  factory IndexData.fromJson(Map<String, dynamic> json) {
    return IndexData(
      depId: json['dep_id'],
      indexId: json['index_id'],
      values: (json['values'] as List<dynamic>)
          .map((item) => ValueItem.fromJson(item))
          .toList(),
      indexName: json['index_name'],
      indexType: json['index_type'],
    );
  }

  // Method for converting the IndexData instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'dep_id': depId,
      'index_id': indexId,
      'values': values.map((value) => value.toJson()).toList(),
      'index_name': indexName,
      'index_type': indexType,
    };
  }
}

class get_indx_name {
  int? id;
  int? dep_id;
  String? name;
  String? type;

  get_indx_name({
    this.id,
    this.dep_id,
    this.name,
    this.type,
  });

  // Factory method to create a public_releations from JSON
  factory get_indx_name.fromJson(Map<String, dynamic> json) {
    return get_indx_name(
      type: json["index_type"],
      dep_id: json['dep_id'],
      id: json['index_id'],
      name: json['index_name'],
    );
  }

  // Method to convert public_releations to JSON
  Map<String, dynamic> toJson() {
    return {
      'index_id': id,
      'dep_id': dep_id,
      'index_name': name,
      'index_type': type,
    };
  }
}

// Example function to parse the JSON data
List<get_indx_name> get_indx_names(String jsonData) {
  final List<dynamic> parsedJson = json.decode(jsonData);
  return parsedJson.map((json) => get_indx_name.fromJson(json)).toList();
}

class Department {
  final int id;
  final String name;

  // Constructor to initialize the object
  Department({required this.id, required this.name});

  // Factory constructor to create a Department object from a JSON map
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      name: json['name'],
    );
  }

  // Method to convert a Department object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
