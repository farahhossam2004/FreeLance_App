import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/client.dart';

class ClientProvider with ChangeNotifier {
  Client? _client;
  bool _isLoading = false;

 // Getters
  Client? get client => _client;
  bool get isLoading => _isLoading;

  Future<void> fetchClientData(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Clients').doc(email).get();
      if (snapshot.exists) {
        _client = Client.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        _client = null; // Client doesn't exist
      }
    } catch (e) {
      print('Error fetching client data: $e');
      _client = null; // Handle error
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners when data changes
    }
  }
}
