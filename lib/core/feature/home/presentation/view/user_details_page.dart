import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(border: OutlineInputBorder())),
        ],
      ),
    );
  }
}
