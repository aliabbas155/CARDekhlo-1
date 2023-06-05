// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShowRoomModel {
  final String name;
  final String rating;
  final String description;
  ShowRoomModel({
    required this.name,
    required this.rating,
    required this.description,
  });

  ShowRoomModel copyWith({
    String? name,
    String? rating,
    String? description,
  }) {
    return ShowRoomModel(
      name: name ?? this.name,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'description': description,
    };
  }

  ShowRoomModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        rating = snapshot.data()['rating'],
        description = snapshot.data()['description'];

  factory ShowRoomModel.fromMap(Map<String, dynamic> map) {
    return ShowRoomModel(
      name: map['name'] as String,
      rating: map['rating'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowRoomModel.fromJson(String source) =>
      ShowRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ShowRoomModel(name: $name, rating: $rating, description: $description)';

  @override
  bool operator ==(covariant ShowRoomModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.rating == rating &&
        other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ rating.hashCode ^ description.hashCode;
}
