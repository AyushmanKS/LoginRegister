import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;

  const HomePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: $email'),
            const SizedBox(height: 10),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
