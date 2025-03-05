import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Futuristic gradient background from deep purple to black.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              // Main Heading with futuristic styling.
              Text(
                "About",
                style: GoogleFonts.nunito(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.white54, thickness: 1),
              const SizedBox(height: 20),
              // Introduction text.
              Text(
                "CyberSec is an interactive platform designed to bridge the gap between theoretical concepts and real-world cybersecurity practices. Our app offers a sophisticated, user-friendly experience that empowers learners at all levels to explore, understand, and apply cryptographic techniques in a dynamic environment.",
                style: GoogleFonts.nunito(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              // Section header for key features.
              Text(
                "Key Features & What We Do:",
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurpleAccent.shade100,
                ),
              ),
              const SizedBox(height: 15),
              // Cybersecurity Learning Module card.
              Card(
                color: Colors.deepPurple.shade800.withOpacity(0.7),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cybersecurity Learning Module:",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Interactive Lessons & Quizzes: Step-by-step tutorials explain complex topics like prime number generation, Diffie-Hellman key exchange, and various encryption algorithms.\n\nGamified Challenges: Earn badges and points while engaging in quizzes and puzzles that reinforce your understanding.",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Encryption & Decryption Tool card.
              Card(
                color: Colors.deepPurple.shade800.withOpacity(0.7),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Encryption & Decryption Tool:",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Real-Time Cryptographic Operations: Easily encrypt and decrypt messages or files using industry-standard algorithms such as AES and RSA.\n\nUser-Friendly Interface: Designed for both beginners and experts, this tool offers a simple, intuitive experience for exploring cryptographic transformations.",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Cryptography Toolkit card.
              Card(
                color: Colors.deepPurple.shade800.withOpacity(0.7),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cryptography Toolkit:",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Algorithm Demonstrations: Experience interactive simulations like the Miller-Rabin Primality Test to see cryptographic principles in action.\n\nKey Generation & More: Generate and visualize cryptographic keys, and experiment with various tools that illustrate how digital signatures and hash functions work.",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Roadmap to Cybersecurity card.
              Card(
                color: Colors.deepPurple.shade800.withOpacity(0.7),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Roadmap to Cybersecurity:",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Structured Learning Path: Follow a curated pathway that guides you from basic cybersecurity principles to advanced techniques.\n\nCurated Resources: Access articles, video tutorials, and hands-on exercises designed to build a robust foundation in cybersecurity.",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Why Choose Our App section.
              Text(
                "Why Choose Our App?",
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurpleAccent.shade100,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Engaging & Interactive: Combines theory with practical application, making learning both enjoyable and effective.\n\nComprehensive & Accessible: Whether you’re a student, professional, or hobbyist, our app caters to all experience levels with clear explanations and interactive tools.\n\nDesigned for Modern Learners: Our clean, intuitive interface and responsive design ensure a seamless experience on any device.\n\nDiscover the power of interactive learning and practical application in cybersecurity—get started with our app and build the skills you need to navigate today’s digital landscape confidently.",
                style: GoogleFonts.nunito(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
