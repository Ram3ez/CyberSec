import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/functions/switch_page.dart";
import "package:cyber_sec/pages/miller_rabbin_page.dart";
import "package:cyber_sec/pages/prime_generator_page.dart";
import "package:cyber_sec/pages/pseudo_random_generator_page.dart";
import "package:flutter/material.dart";

class NumberTheoryPage extends StatelessWidget {
  const NumberTheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Number Theory & Key Gen",
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Miller Rabbin Test",
                onPress: SwitchPage.switchPage(context, MillerRabbinPage()),
              ),
              CustomButton(
                label: "Prime Generator",
                onPress: SwitchPage.switchPage(context, PrimeGeneratorPage()),
              ),
              CustomButton(
                label: "PseudoRandom Number Generator",
                onPress: SwitchPage.switchPage(
                  context,
                  PseudoRandomGeneratorPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
