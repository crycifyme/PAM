// lib/domain/entities/medical_center.dart
class MedicalCenter {
  final String image;
  final String title;
  final double reviewRate;
  final double distanceKm;

  MedicalCenter({
    required this.image,
    required this.title,
    required this.reviewRate,
    required this.distanceKm,
  });
}
