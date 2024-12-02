// lib/domain/repositories/repository.dart
import '../entities/category.dart';
import '../entities/medical_center.dart';
import '../entities/doctor.dart';
import '../entities/banner_data.dart';

abstract class Repository {
  Future<List<Category>> getCategories();
  Future<List<MedicalCenter>> getMedicalCenters();
  Future<List<Doctor>> getDoctors();
  Future<List<BannerData>> getBanners();
}
