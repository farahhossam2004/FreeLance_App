import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.title, required this.noOfFreelancers});
  final String title;
  final int noOfFreelancers;
  @override
  Widget build(context) {
    return Card(
      shadowColor: Colors.green,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 46, 117, 48)
        ),),
        subtitle: Text('Available Freelancers: $noOfFreelancers'),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.green,),
        onTap: (){},
      ),
    );
  }
}