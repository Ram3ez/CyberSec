import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final double mainTitleSeperation = 15;
  final double newMainTitle = 25;
  final double secondaryTitleSeperation = 10;
  final double subTitleSeperation = 5;
  final double newSubTitle = 8;

  @override
  Widget build(BuildContext context) {
    final TextStyle? largeTitle = Theme.of(context).textTheme.titleLarge;
    final TextStyle? mainTitle = Theme.of(context).textTheme.titleMedium;
    final TextStyle? smallTitle = Theme.of(context).textTheme.titleSmall;
    final TextStyle? smallBody = Theme.of(context).textTheme.bodySmall;
    final TextStyle? mediumBody = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("About", style: largeTitle),
            SizedBox(height: mainTitleSeperation),
            Text(
              """CyberSec is an interactive platform designed to bridge the gap between theoretical concepts and real-world cybersecurity practices.\n\nOur app offers a soothing, user-friendly experience that empowers learners at all levels to explore, understand, and apply cryptographic techniques in a dynamic environment.""",
              style: smallBody,
            ),
            SizedBox(height: newMainTitle),
            Text("Key Features & What We Do:", style: mainTitle),
            SizedBox(height: mainTitleSeperation),
            Text("Interactive Cryptography Tools", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text("Text Encryption & Decryption: ", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Supports standard encryption algorithms like AES (Advanced Encryption Standard) and RSA (Rivest–Shamir–Adleman) to allow users to encrypt and decrypt custom text in real time.
Learn how public and private key systems work in practice through simple input-output operations.""",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Message Authentication Code (MAC): ", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Allows users to generate and verify message authentication codes to ensure integrity and authenticity of messages.
Teaches HMAC (Hash-based Message Authentication Code) in a user-driven environment.""",
              style: smallBody,
            ),
            SizedBox(height: secondaryTitleSeperation),
            Text("Number Theory & Key Generation", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text("Miller-Rabin Primality Test:", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Run interactive simulations of the Miller-Rabin algorithm, a probabilistic method to test whether a number is prime.
Essential for cryptography where prime numbers are used in key generation (like RSA).""",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Large Prime Number Generator:", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Generate strong prime numbers required for cryptographic keys.
Learn how randomness and primality come together to build secure systems.""",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Pseudo-Random Number Generator:", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Demonstrates how pseudo-random numbers are used in cryptography and password generation.
Understand concepts like entropy, seed values, and deterministic randomness.""",
              style: smallBody,
            ),
            SizedBox(height: secondaryTitleSeperation),
            Text("Password Security Toolkit", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text("Password Generator:", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Create strong, random passwords based on user-defined settings including length, inclusion of symbols, numbers, uppercase, and lowercase letters.
Helps users understand entropy and password complexity.""",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Password Strength Tester:", style: mediumBody),
            SizedBox(height: subTitleSeperation),
            Text(
              """Check how secure your password is based on a series of logical and regex-based checks:
- Minimum length (≥ 8 characters)
- Includes uppercase and lowercase letters
- Contains numbers and special characters
- Real-time feedback with suggestions for improvement""",
              style: smallBody,
            ),
            SizedBox(height: newMainTitle),
            Text("Why Use CyberSec?", style: mainTitle),
            SizedBox(height: mainTitleSeperation),
            Text("Technical Yet Simple:", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text(
              "Complex topics like encryption, key generation, and primality are broken down into intuitive modules with hands-on tools.",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("User-Centered Design:", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text(
              "Clean UI and responsive layout for all screen sizes.",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Offline-Ready & Lightweight:", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text(
              "Flutter-based build ensures smooth performance on Android, desktop, and web platforms.",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("Visual & Practical Learning:", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text(
              "Unlike passive reading, this app enables actual simulation and experimentation.",
              style: smallBody,
            ),
            SizedBox(height: newSubTitle),
            Text("All-in-One Platform:", style: smallTitle),
            SizedBox(height: secondaryTitleSeperation),
            Text(
              "No need to switch between tools or websites everything from password checks to encryption is built-in.",
              style: smallBody,
            ),
          ],
        ),
      ),
    );
  }
}
