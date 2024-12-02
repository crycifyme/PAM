// lib/presentation/widgets/medical_center_card.dart
import 'package:flutter/material.dart';

class MedicalCenterCard extends StatelessWidget {
  final String image;
  final String name;
  final String rating;
  final String distance;

  const MedicalCenterCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
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
}
