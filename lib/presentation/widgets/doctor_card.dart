// lib/presentation/widgets/doctor_card.dart
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String rating;
  final String reviews;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
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
