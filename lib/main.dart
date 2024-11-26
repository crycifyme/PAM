import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  List<Category> categories = [];
  List<MedicalCenter> medicalCenters = [];
  List<Doctor> doctors = [];
  List<BannerData> banners = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/v1.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    setState(() {
      categories = (jsonData['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList();
      medicalCenters = (jsonData['nearby_centers'] as List)
          .map((e) => MedicalCenter.fromJson(e))
          .toList();
      doctors = (jsonData['doctors'] as List)
          .map((e) => Doctor.fromJson(e))
          .toList();
      banners = (jsonData['banners'] as List)
          .map((e) => BannerData.fromJson(e))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Search'),
      ),
      body: categories.isEmpty || medicalCenters.isEmpty || doctors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
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
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories
                      .map((category) => _buildCategoryCard(
                      category.icon, category.title))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nearby Medical Centers',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: medicalCenters
                      .map((center) => _buildMedicalCenterCard(
                    center.image,
                    center.title,
                    center.reviewRate.toString(),
                    '${center.distanceKm} km',
                  ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${doctors.length} Found',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...doctors.map((doctor) => _buildDoctorCard(
                doctor.fullName,
                doctor.typeOfDoctor,
                doctor.reviewRate.toString(),
                '${doctor.reviewsCount} Reviews',
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[100],
            child: Image.network(icon, width: 30, height: 30),
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

  Widget _buildMedicalCenterCard(
      String image, String name, String rating, String distance) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 250,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _buildDoctorCard(
      String name, String specialization, String rating, String reviews) {
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

class Category {
  final String title;
  final String icon;

  Category({required this.title, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      icon: json['icon'],
    );
  }
}

class MedicalCenter {
  final String image;
  final String title;
  final double reviewRate;
  final double distanceKm;

  MedicalCenter({
    required this.image,
    required this.title,
    required this.reviewRate,
    required this.distanceKm,
  });

  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    return MedicalCenter(
      image: json['image'],
      title: json['title'],
      reviewRate: json['review_rate'],
      distanceKm: json['distance_km'],
    );
  }
}

class Doctor {
  final String fullName;
  final String typeOfDoctor;
  final double reviewRate;
  final int reviewsCount;

  Doctor({
    required this.fullName,
    required this.typeOfDoctor,
    required this.reviewRate,
    required this.reviewsCount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      reviewRate: json['review_rate'],
      reviewsCount: json['reviews_count'],
    );
  }
}

class BannerData {
  final String title;
  final String description;
  final String image;

  BannerData({
    required this.title,
    required this.description,
    required this.image,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
