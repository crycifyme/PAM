
import '../entities/doctor.dart';
import '../repositories/doctor_repository.dart';

class FetchDoctors {
  final DoctorRepository repository;

  FetchDoctors(this.repository);

  Future<List<Doctor>> call() {
    return repository.fetchDoctors();
  }
}
