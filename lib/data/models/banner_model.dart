// lib/data/models/banner_model.dart
import '../../domain/entities/banner_data.dart';

class BannerModel extends BannerData {
  BannerModel({
    required String title,
    required String description,
    required String image,
  }) : super(
    title: title,
    description: description,
    image: image,
  );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
