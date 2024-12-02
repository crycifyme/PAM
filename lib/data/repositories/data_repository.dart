// lib/data/repositories/data_repository.dart
import '../../domain/entities/category.dart';
import '../../domain/entities/medical_center.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/entities/banner_data.dart';
import '../../domain/repositories/repository.dart';
import '../models/category_model.dart';
import '../models/medical_center_model.dart';
import '../models/doctor_model.dart';
import '../models/banner_model.dart';
import '../data_sources/json_data_source.dart';

class DataRepository implements Repository {
  final JsonDataSource jsonDataSource;

  DataRepository(this.jsonDataSource);

  @override
  Future<List<Category>> getCategories() async {
    final data = await jsonDataSource.loadJson();
    return (data['categories'] as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<MedicalCenter>> getMedicalCenters() async {
    final data = await jsonDataSource.loadJson();
    return (data['nearby_centers'] as List)
        .map((json) => MedicalCenterModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<Doctor>> getDoctors() async {
    final data = await jsonDataSource.loadJson();
    return (data['doctors'] as List)
        .map((json) => DoctorModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<BannerData>> getBanners() async {
    final data = await jsonDataSource.loadJson();
    return (data['banners'] as List)
        .map((json) => BannerModel.fromJson(json))
        .toList();
  }
}
