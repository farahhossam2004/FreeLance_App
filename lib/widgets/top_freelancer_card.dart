import 'package:flutter/material.dart';

class TopFreelancerCard extends StatelessWidget {
  final String name;
  final double rating;
  final String imagePath;
  final String description;

  const TopFreelancerCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 16,
                    )
                  ],
                ),
                Text(description, style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 42, 41, 41)), maxLines: 2, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
