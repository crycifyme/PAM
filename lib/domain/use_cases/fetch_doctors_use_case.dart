// lib/domain/use_cases/fetch_doctors_use_case.dart
import '../repositories/repository.dart';
import '../entities/doctor.dart';

class FetchDoctorsUseCase {
  final Repository repository;

  FetchDoctorsUseCase(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.getDoctors();
  }
}
