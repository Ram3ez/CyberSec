import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/miller_rabbin_test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MillerRabbinPage extends StatefulWidget {
  const MillerRabbinPage({super.key});

  @override
  State<MillerRabbinPage> createState() => _MillerRabbinPageState();
}

class _MillerRabbinPageState extends State<MillerRabbinPage> {
  final TextEditingController controller = TextEditingController();
  bool isError = false;
  bool submitted = false;
  bool isPrime = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Miller-Rabin Primality Test Steps:",
        body: '''
Step 1: Choose an odd integer n (n > 2).
  - Even numbers (except 2) are not prime.

Step 2: Write (n - 1) as 2^s * d (with d odd).
  - Factor out powers of 2 from n - 1.

Step 3: Choose a random integer a (2 ≤ a ≤ n - 2).

Step 4: Compute x = a^d mod n.
  - If x is 1 or n - 1, the test is inconclusive.

Step 5: Repeat squaring x up to (s - 1) times.
  - If x becomes n - 1, the test is inconclusive.
  - If x never becomes n - 1, n is composite.

Step 6: Repeat for several values of a.
  - Consistency implies n is probably prime.
        ''',
      ),
      title: "Miller Rabbin Test",
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
                  // Heading that introduces the test
                  Text(
                    "Learn How Miller-Rabin Test Works",
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Brief explanation of the test purpose
                  Text(
                    "Enter a number below to test its primality using the Miller-Rabin algorithm. "
                    "This probabilistic test helps determine if a number is likely prime or definitely composite.",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  // Input field for the number
                  CustomTextField(label: "Number:", controller: controller),
                  const SizedBox(height: 10),
                  // Error message if input is invalid
                  isError
                      ? Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Please enter a valid number",
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 30),
                  // Submit button to run the test
                  CustomButton(
                    label: "Submit",
                    onPress: () {
                      if (controller.text.isEmpty) {
                        setState(() {
                          isError = true;
                          submitted = false;
                        });
                      } else {
                        setState(() {
                          isError = false;
                        });
                        try {
                          isPrime = millerRabinTest(
                            BigInt.parse(controller.text),
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
                  // Display the result after submission
                  submitted
                      ? Text(
                        "${controller.text} is ${isPrime ? "probably prime" : "not a"} prime number",
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              isPrime ? Colors.greenAccent : Colors.redAccent,
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
