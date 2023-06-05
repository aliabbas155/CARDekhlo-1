import 'dart:convert';

import 'package:flutter/foundation.dart';

class CarModel {
  final String id;
  final String company;
  final String model;
  final String engine;
  final String seats;
  final String average;
  final String body;
  final String suspension;

  final List<dynamic> images;
  CarModel({
    required this.id,
    required this.company,
    required this.model,
    required this.engine,
    required this.seats,
    required this.average,
    required this.body,
    required this.suspension,
    required this.images,
  });

  CarModel copyWith({
    String? id,
    String? company,
    String? model,
    String? engine,
    String? seats,
    String? average,
    String? body,
    String? suspension,
    List<dynamic>? images,
  }) {
    return CarModel(
      id: id ?? this.id,
      company: company ?? this.company,
      model: model ?? this.model,
      engine: engine ?? this.engine,
      seats: seats ?? this.seats,
      average: average ?? this.average,
      body: body ?? this.body,
      suspension: suspension ?? this.suspension,
      images: images ?? this.images,
    );
  }

  CarModel.fromSnapshot(snapshot)
      : id = snapshot.data()['id'] ?? '',
        company = snapshot.data()['company'] ?? '',
        average = snapshot.data()['average'] ?? '',
        body = snapshot.data()['body'] ?? '',
        engine = snapshot.data()['engine'] ?? '',
        images = snapshot.data()['images'],
        model = snapshot.data()['model'] ?? '',
        seats = snapshot.data()['seats'] ?? '',
        suspension = snapshot.data()['suspension'] ?? '';
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'company': company,
      'model': model,
      'engine': engine,
      'seats': seats,
      'average': average,
      'body': body,
      'suspension': suspension,
      'images': images,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] ?? '',
      company: map['company'] ?? '',
      model: map['model'] ?? '',
      engine: map['engine'] ?? '',
      seats: map['seats'] ?? '',
      average: map['average'] ?? '',
      body: map['body'] ?? '',
      suspension: map['suspension'] ?? '',
      images: List<dynamic>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarModel(id: $id, company: $company, model: $model, engine: $engine, seats: $seats, average: $average, body: $body, suspension: $suspension, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarModel &&
        other.id == id &&
        other.company == company &&
        other.model == model &&
        other.engine == engine &&
        other.seats == seats &&
        other.average == average &&
        other.body == body &&
        other.suspension == suspension &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        company.hashCode ^
        model.hashCode ^
        engine.hashCode ^
        seats.hashCode ^
        average.hashCode ^
        body.hashCode ^
        suspension.hashCode ^
        images.hashCode;
  }
}
