
import '../../domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String name,
    required String specialty,
    required String location,
    required double rating,
    required int reviews,
  }) : super(
          name: name,
          specialty: specialty,
          location: location,
          rating: rating,
          reviews: reviews,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialty: json['specialty'],
      location: json['location'],
      rating: json['rating'],
      reviews: json['reviews'],
    );
  }
}
