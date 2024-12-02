// lib/data/models/medical_center_model.dart
import '../../domain/entities/medical_center.dart';

class MedicalCenterModel extends MedicalCenter {
  MedicalCenterModel({
    required String image,
    required String title,
    required double reviewRate,
    required double distanceKm,
  }) : super(
    image: image,
    title: title,
    reviewRate: reviewRate,
    distanceKm: distanceKm,
  );

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      image: json['image'],
      title: json['title'],
      reviewRate: (json['review_rate'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
    );
  }
}
