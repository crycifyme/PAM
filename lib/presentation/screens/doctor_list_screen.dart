import 'package:flutter/material.dart';
import '../../domain/entities/doctor.dart';

class DoctorListScreen extends StatefulWidget {
  final List<Doctor> doctors;

  DoctorListScreen({required this.doctors});

  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  late List<Doctor> filteredDoctors;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctors = widget.doctors;
    _searchController.addListener(_filterDoctors);
  }

  void _filterDoctors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredDoctors = widget.doctors.where((doctor) {
        return doctor.name.toLowerCase().contains(query) ||
            doctor.specialty.toLowerCase().contains(query) ||
            doctor.location.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search doctors",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Slider Section
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade100, Colors.blue.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            doctor.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            doctor.specialty,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            doctor.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "${doctor.rating} ★",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // List Section
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        doctor.name[0],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(doctor.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor.specialty),
                        Text(
                          doctor.location,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${doctor.rating} ★",
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${doctor.reviews} reviews",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Mock Data Example
void main() {
  runApp(MaterialApp(
    home: DoctorListScreen(
      doctors: [
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
      ],
    ),
  ));
}
