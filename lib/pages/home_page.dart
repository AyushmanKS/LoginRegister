import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;

  const HomePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF253143),
                Color(0xFF172133),
                Color.fromARGB(255, 55, 73, 107),
                Color(0xFF10182a),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email,
                                color: Colors.white.withOpacity(0.8)),
                            const SizedBox(width: 10),
                            Text(
                              'Email: $email',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock,
                                color: Colors.white.withOpacity(0.8)),
                            const SizedBox(width: 10),
                            Text(
                              'Password: $password',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
