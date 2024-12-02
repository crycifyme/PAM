// lib/domain/use_cases/fetch_medical_centers_use_case.dart
import '../repositories/repository.dart';
import '../entities/medical_center.dart';

class FetchMedicalCentersUseCase {
  final Repository repository;

  FetchMedicalCentersUseCase(this.repository);

  Future<List<MedicalCenter>> call() async {
    return await repository.getMedicalCenters();
  }
}
