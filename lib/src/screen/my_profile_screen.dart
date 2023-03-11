import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(child: Text('My Profile Screen')),
    );
  }
}
