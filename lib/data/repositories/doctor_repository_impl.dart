import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  @override
  Future<List<Doctor>> fetchDoctors() async {
    // Simulate fetching data from a datasource
    return [
      Doctor(
        name: "Dr. David Patel",
        specialty: "Cardiologist",
        location: "Cardiology Center, NY",
        rating: 4.5,
        reviews: 1872,
      ),
      Doctor(
        name: "Dr. Emily Chen",
        specialty: "Dermatologist",
        location: "Skin Care Clinic, CA",
        rating: 4.8,
        reviews: 1520,
      ),
      Doctor(
        name: "Dr. John Smith",
        specialty: "Orthopedic Surgeon",
        location: "Orthopedic Hospital, TX",
        rating: 4.6,
        reviews: 980,
      ),
      Doctor(
        name: "Dr. Maria Gonzalez",
        specialty: "Pediatrician",
        location: "Children's Health Center, FL",
        rating: 4.9,
        reviews: 2100,
      ),
      Doctor(
        name: "Dr. Ahmed Khan",
        specialty: "Neurologist",
        location: "Brain Health Institute, IL",
        rating: 4.7,
        reviews: 1340,
      ),
      Doctor(
        name: "Dr. Sarah Lee",
        specialty: "Ophthalmologist",
        location: "Vision Care Center, WA",
        rating: 4.4,
        reviews: 875,
      ),
      Doctor(
        name: "Dr. Michael Brown",
        specialty: "General Practitioner",
        location: "Family Health Clinic, NJ",
        rating: 4.3,
        reviews: 650,
      ),
      Doctor(
        name: "Dr. Sophia Martinez",
        specialty: "Endocrinologist",
        location: "Diabetes and Hormone Clinic, AZ",
        rating: 4.5,
        reviews: 790,
      ),
      Doctor(
        name: "Dr. Richard Wilson",
        specialty: "Psychiatrist",
        location: "Mental Wellness Center, CO",
        rating: 4.6,
        reviews: 1200,
      ),
      Doctor(
        name: "Dr. Olivia Nguyen",
        specialty: "Gastroenterologist",
        location: "Digestive Health Clinic, MA",
        rating: 4.8,
        reviews: 1100,
      ),
    ];
  }
}
