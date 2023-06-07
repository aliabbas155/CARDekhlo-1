// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String gearType;
  final String horsePower;
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
    required this.gearType,
    required this.horsePower,
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
    String? gearType,
    String? horsePower,
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
      gearType: gearType ?? this.gearType,
      horsePower: horsePower ?? this.horsePower,
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
        horsePower = snapshot.data()['horsePower'] ?? '',
        gearType = snapshot.data()['gearType'] ?? '',
        images = snapshot.data()['images'],
        model = snapshot.data()['model'] ?? '',
        seats = snapshot.data()['seats'] ?? '',
        suspension = snapshot.data()['suspension'] ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'company': company,
      'model': model,
      'engine': engine,
      'seats': seats,
      'average': average,
      'body': body,
      'gearType': gearType,
      'horsePower': horsePower,
      'suspension': suspension,
      'images': images,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
        id: map['id'] as String,
        company: map['company'] as String,
        model: map['model'] as String,
        engine: map['engine'] as String,
        seats: map['seats'] as String,
        average: map['average'] as String,
        body: map['body'] as String,
        gearType: map['gearType'] as String,
        horsePower: map['horsePower'] as String,
        suspension: map['suspension'] as String,
        images: List<dynamic>.from(
          (map['images'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(id: $id, company: $company, model: $model, engine: $engine, seats: $seats, average: $average, body: $body, gearType: $gearType, horsePower: $horsePower, suspension: $suspension, images: $images)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.company == company &&
        other.model == model &&
        other.engine == engine &&
        other.seats == seats &&
        other.average == average &&
        other.body == body &&
        other.gearType == gearType &&
        other.horsePower == horsePower &&
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
        gearType.hashCode ^
        horsePower.hashCode ^
        suspension.hashCode ^
        images.hashCode;
  }
}
