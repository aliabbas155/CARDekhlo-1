// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ShowRoomModel {
  final String name;
  final String rating;
  final String description;
  final String id;
  final GeoPoint address;
  ShowRoomModel({
    required this.name,
    required this.rating,
    required this.description,
    required this.id,
    required this.address,
  });
  ShowRoomModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        rating = snapshot.data()['rating'],
        id = snapshot.data()['id'],
        address = snapshot.data()['address'],
        description = snapshot.data()['description'];

  ShowRoomModel copyWith({
    String? name,
    String? rating,
    String? description,
    String? id,
    GeoPoint? address,
  }) {
    return ShowRoomModel(
      name: name ?? this.name,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      id: id ?? this.id,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'description': description,
      'id': id,
      'address': address,
    };
  }

  factory ShowRoomModel.fromMap(Map<String, dynamic> map) {
    return ShowRoomModel(
      name: map['name'] as String,
      rating: map['rating'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowRoomModel.fromJson(String source) =>
      ShowRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShowRoomModel(name: $name, rating: $rating, description: $description, id: $id, address: $address)';
  }

  @override
  bool operator ==(covariant ShowRoomModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.rating == rating &&
        other.description == description &&
        other.id == id &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        rating.hashCode ^
        description.hashCode ^
        id.hashCode ^
        address.hashCode;
  }
}
