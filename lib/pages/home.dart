import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/pages/encryption_page.dart";
import "package:cyber_sec/pages/miller_rabbin_page.dart";
import "package:cyber_sec/pages/prime_generator_page.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              CustomButton(
                label: "Text Encryption/Decryption",
                onPress: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => EncryptionPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
