import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorSearchApp());
}

class DoctorSearchApp extends StatelessWidget {
  const DoctorSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DoctorSearchHomePage(),
    );
  }
}

class DoctorSearchHomePage extends StatefulWidget {
  const DoctorSearchHomePage({super.key});

  @override
  State<DoctorSearchHomePage> createState() => _DoctorSearchHomePageState();
}

class _DoctorSearchHomePageState extends State<DoctorSearchHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text(
                    'Seattle, USA',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctor...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard(Icons.health_and_safety, 'Dentistry'),
                    _buildCategoryCard(Icons.favorite, 'Cardiology'),
                    _buildCategoryCard(Icons.medical_services, 'Pulmonology'),
                    _buildCategoryCard(Icons.local_hospital, 'General'),
                    _buildCategoryCard(Icons.healing, 'Neurology'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nearby Medical Centers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildMedicalCenterCard('Sunrise Health Clinic', '5.0', '2.5 km'),
                    _buildMedicalCenterCard('Golden Cardio Clinic', '4.9', '2.5 km'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '532 Found',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildDoctorCard('Dr. David Patel', 'Cardiologist', '4.9', '1,337 Reviews'),
              _buildDoctorCard('Dr. Jessica Turner', 'Gynecologist', '4.9', '1,337 Reviews'),
              _buildDoctorCard('Dr. Michael Johnson', 'Orthopedic Surgery', '4.7', '1,337 Reviews'),
              _buildDoctorCard('Dr. Maxim Marcinkevich', 'Pediatrics', '5.0', '1488 Reviews'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[100],
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalCenterCard(String name, String rating, String distance) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 250,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/T._Mosneaga_Republican_Clinical_Hospital_2023.jpg/640px-T._Mosneaga_Republican_Clinical_Hospital_2023.jpg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(rating),
                      const SizedBox(width: 10),
                      Text(distance),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(String name, String specialization, String rating, String reviews) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: const Icon(Icons.person, color: Colors.blue),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialization),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(rating),
                const SizedBox(width: 10),
                Text(reviews),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.favorite_border),
      ),
    );
  }
}
