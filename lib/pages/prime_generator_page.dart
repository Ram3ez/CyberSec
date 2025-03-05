import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/prime_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimeGeneratorPage extends StatefulWidget {
  const PrimeGeneratorPage({super.key});

  @override
  State<PrimeGeneratorPage> createState() => _PrimeGeneratorPageState();
}

class _PrimeGeneratorPageState extends State<PrimeGeneratorPage> {
  final TextEditingController bitsController = TextEditingController();
  final TextEditingController casesController = TextEditingController();
  bool isError = false;
  bool submitted = false;
  BigInt prime = BigInt.from(0);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Steps to Generate a Large Prime:",
        body: """1. Generate a random odd number of the desired bit length.
   - Ensure the highest bit is set to maintain length.
   - Ensure the last bit is set to make it odd.

2. Perform the Miller-Rabin primality test.
   - Express (n-1) as d * 2^s and choose random base a.
   - If the candidate passes multiple tests, it's probably prime.

3. Repeat until a prime number is found.
4. Display the generated prime.
""",
      ),
      title: "Generate Prime",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Page Heading
                  Text(
                    "Generate a Large Prime Number",
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Brief explanation text
                  Text(
                    "Enter the desired bit length and optionally the number of test cases. "
                    "The algorithm uses the Miller-Rabin test to verify if the candidate is prime.",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  // Input for bits
                  CustomTextField(label: "Bits:", controller: bitsController),
                  const SizedBox(height: 10),
                  isError
                      ? Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Please enter a valid number for bits.",
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 20),
                  // Input for test cases (optional)
                  CustomTextField(
                    label: "Cases (optional):",
                    controller: casesController,
                  ),
                  const SizedBox(height: 30),
                  // Submit Button
                  CustomButton(
                    label: "Submit",
                    onPress: () {
                      if (bitsController.text.isEmpty) {
                        setState(() {
                          isError = true;
                          submitted = false;
                        });
                      } else {
                        setState(() {
                          isError = false;
                        });
                        try {
                          int cases =
                              casesController.text.isEmpty
                                  ? 5
                                  : int.parse(casesController.text);
                          prime = generateLargePrime(
                            int.parse(bitsController.text),
                            cases,
                          );
                          setState(() {
                            submitted = true;
                          });
                        } catch (_) {
                          setState(() {
                            isError = true;
                            submitted = false;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  // Display the generated prime
                  submitted
                      ? Text(
                        "Generated Prime Number:\n$prime",
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                        textAlign: TextAlign.center,
                      )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
