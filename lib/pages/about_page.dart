import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("About", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 12),
            Text(
              """CyberSec is an interactive platform designed to bridge the gap between theoretical concepts and real-world cybersecurity practices.\n\nOur app offers a soothing, user-friendly experience that empowers learners at all levels to explore, understand, and apply cryptographic techniques in a dynamic environment.""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 25),
            Text(
              "Key Features & What We Do:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15),
            Text(
              "Cybersecurity Learning Module:",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            Text(
              """Interactive Lessons & Quizzes: Step-by-step tutorials explain complex topics like prime number generation, Diffie-Hellman key exchange, and various encryption algorithms.
Gamified Challenges: Earn badges and points while engaging in quizzes and puzzles that reinforce your understanding.""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            Text(
              "Encryption & Decryption Tool:",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            Text(
              """Real-Time Cryptographic Operations: Easily encrypt and decrypt messages or files using industry-standard algorithms such as AES and RSA.
User-Friendly Interface: Designed for both beginners and experts, this tool offers a simple, intuitive experience for exploring cryptographic transformations.""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            Text(
              "Cryptography Toolkit:",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),

            Text(
              """Algorithm Demonstrations: Experience interactive simulations like the Miller-Rabin Primality Test to see cryptographic principles in action.
Key Generation & More: Generate and visualize cryptographic keys, and experiment with various tools that illustrate how digital signatures and hash functions work.""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            Text(
              "Roadmap to Cybersecurity:",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            Text(
              """Structured Learning Path: Follow a curated pathway that guides you from basic cybersecurity principles to advanced techniques.
Curated Resources: Access articles, video tutorials, and hands-on exercises designed to build a robust foundation in cybersecurity.""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 25),
            Text(
              "Why Choose Our App?",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),

            Text(
              """
Engaging & Interactive: Combines theory with practical application, making learning both enjoyable and effective.
Comprehensive & Accessible: Whether you’re a student, professional, or hobbyist, our app caters to all experience levels with clear explanations and interactive tools.
Designed for Modern Learners: Our clean, intuitive interface and responsive design ensure a seamless experience on any device.
Discover the power of interactive learning and practical application in cybersecurity—get started with our app and build the skills you need to navigate today’s digital landscape confidently""",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
