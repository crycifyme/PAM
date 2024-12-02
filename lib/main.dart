
import 'package:flutter/material.dart';
import 'presentation/screens/doctor_list_screen.dart';
import 'data/repositories/doctor_repository_impl.dart';
import 'domain/usecases/fetch_doctors.dart';
import 'domain/entities/doctor.dart';

void main() {
  runApp(DoctorAppointmentApp());
}

class DoctorAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorAppointmentHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DoctorAppointmentHome extends StatelessWidget {
  final FetchDoctors fetchDoctors = FetchDoctors(DoctorRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Doctor>>(
      future: fetchDoctors.call(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return DoctorListScreen(doctors: snapshot.data ?? []);
        }
      },
    );
  }
}
