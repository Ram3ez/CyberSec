import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/pages/encryption_page.dart";
import "package:cyber_sec/pages/miller_rabbin_page.dart";
import "package:cyber_sec/pages/prime_generator_page.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade800, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Welcoming heading
                Text(
                  "Welcome to CyberSec",
                  style: GoogleFonts.nunito(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // Button for Miller Rabbin Test
                CustomButton(
                  label: "Miller Rabbin Test",
                  onPress: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => MillerRabbinPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Button for Prime Number Generation
                CustomButton(
                  label: "Generate Prime Number",
                  onPress: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => PrimeGeneratorPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Button for Text Encryption/Decryption
                CustomButton(
                  label: "Text Encryption/Decryption",
                  onPress: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => EncryptionPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
