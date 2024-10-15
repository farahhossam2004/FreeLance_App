import 'package:flutter/material.dart';

class TopFreelancerCard extends StatelessWidget {
  final String name;
  final String rating;
  final String? imagePath;
  final String description;

  const TopFreelancerCard(
      {super.key,
      required this.name,
      required this.rating,
      this.imagePath, required this.description});

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
            child: imagePath != null && imagePath!.isNotEmpty
                ? Image.network( // Assuming you're fetching from Firestore
                    imagePath!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image); // Placeholder in case of an error
                    },
                  )
                : const Icon(Icons.person, size: 120),
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
