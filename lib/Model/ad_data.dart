// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AdData {
  final String id;
  final String userId;
  final List<String> carImages;
  final String adTitle;
  final String carLocation;
  final String carCompany;
  final String carModel;
  final String carVariant;
  final String carRegistration;
  final String carMilage;
  final String carPrice;
  final String carDescription;
  AdData({
    required this.id,
    required this.userId,
    required this.carImages,
    required this.adTitle,
    required this.carLocation,
    required this.carCompany,
    required this.carModel,
    required this.carVariant,
    required this.carRegistration,
    required this.carMilage,
    required this.carPrice,
    required this.carDescription,
  });

  AdData copyWith({
    String? id,
    String? userId,
    List<String>? carImages,
    String? adTitle,
    String? carLocation,
    String? carCompany,
    String? carModel,
    String? carVariant,
    String? carRegistration,
    String? carMilage,
    String? carPrice,
    String? carDescription,
  }) {
    return AdData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      carImages: carImages ?? this.carImages,
      adTitle: adTitle ?? this.adTitle,
      carLocation: carLocation ?? this.carLocation,
      carCompany: carCompany ?? this.carCompany,
      carModel: carModel ?? this.carModel,
      carVariant: carVariant ?? this.carVariant,
      carRegistration: carRegistration ?? this.carRegistration,
      carMilage: carMilage ?? this.carMilage,
      carPrice: carPrice ?? this.carPrice,
      carDescription: carDescription ?? this.carDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'carImages': carImages,
      'adTitle': adTitle,
      'carLocation': carLocation,
      'carCompany': carCompany,
      'carModel': carModel,
      'carVariant': carVariant,
      'carRegistration': carRegistration,
      'carMilage': carMilage,
      'carPrice': carPrice,
      'carDescription': carDescription,
    };
  }

  factory AdData.fromMap(Map<String, dynamic> map) {
    return AdData(
      id: map['id'] as String,
      userId: map['userId'] as String,
      carImages: List<String>.from((map['carImages'])),
      adTitle: map['adTitle'] as String,
      carLocation: map['carLocation'] as String,
      carCompany: map['carCompany'] as String,
      carModel: map['carModel'] as String,
      carVariant: map['carVariant'] as String,
      carRegistration: map['carRegistration'] as String,
      carMilage: map['carMilage'] as String,
      carPrice: map['carPrice'] as String,
      carDescription: map['carDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdData.fromJson(String source) => AdData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdData(id: $id, userId: $userId, carImages: $carImages, adTitle: $adTitle, carLocation: $carLocation, carCompany: $carCompany, carModel: $carModel, carVariant: $carVariant, carRegistration: $carRegistration, carMilage: $carMilage, carPrice: $carPrice, carDescription: $carDescription)';
  }

  @override
  bool operator ==(covariant AdData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      listEquals(other.carImages, carImages) &&
      other.adTitle == adTitle &&
      other.carLocation == carLocation &&
      other.carCompany == carCompany &&
      other.carModel == carModel &&
      other.carVariant == carVariant &&
      other.carRegistration == carRegistration &&
      other.carMilage == carMilage &&
      other.carPrice == carPrice &&
      other.carDescription == carDescription;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      carImages.hashCode ^
      adTitle.hashCode ^
      carLocation.hashCode ^
      carCompany.hashCode ^
      carModel.hashCode ^
      carVariant.hashCode ^
      carRegistration.hashCode ^
      carMilage.hashCode ^
      carPrice.hashCode ^
      carDescription.hashCode;
  }
}
