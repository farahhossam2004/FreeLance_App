import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/client.dart';
import 'package:freelance_app/models/free_lancer.dart';

class ClientProvider with ChangeNotifier {
  Client? _client;
  bool _isLoading = false;
  FreeLancer? _freeLancer;
  String? _email;
  String? _role;

  // Getters
  Client? get client => _client;
  FreeLancer? get freelancer => _freeLancer;
  bool get isLoading => _isLoading;
  String? get email => _email;
  String? get role => _role;

  Future<void> fetchClientData(String email) async {
    _isLoading = true;
    _email = email;
    
    notifyListeners();

    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        _role = data['role'];
        if (data['role'] == 'client') {
          _client = Client.fromMap(snapshot.data() as Map<String, dynamic>);
        } else {
          _freeLancer =
              FreeLancer.fromMap(snapshot.data() as Map<String, dynamic>);
        }
      } else {
        _client = null; // Client doesn't exist
        _freeLancer = null; // and free lancer doesn't exist
      }
    } catch (e) {
      print('Error fetching client data: $e');
      _client = null; // Handle error
      _freeLancer = null;
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners when data changes
    }
  }

  Future<void> fetchOtherClientData(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      if (snapshot.exists) {
        _client = Client.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        _client = null; // Client doesn't exist
      }
    } catch (e) {
      print('Error fetching other client data: $e');
      _client = null; // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
