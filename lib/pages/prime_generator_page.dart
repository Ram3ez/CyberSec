import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/prime_generator.dart';
import 'package:flutter/material.dart';

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
  bool isPrime = false;
  BigInt prime = BigInt.from(0);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Steps to Generate a Large Prime:",
        body: """1. Generate a random odd number of the desired bit length.
     - Ensure the highest bit is set to maintain length.
     - Ensure the last bit is set to make it odd.

  2. Perform the Miller-Rabin primality test to check if the number is prime.
     - Find `d` such that n-1 = d * 2^s.
     - Select random base `a` and compute `x = a^d mod n`.
     - If `x` is 1 or n-1, continue testing.
     - Otherwise, repeatedly square `x` and check for n-1.

  3. Repeat the process until a prime number is found.
     - If the number fails the test, generate a new candidate.
     - If it passes, return it as a prime number.

  4. Print the generated prime.""",
      ),
      title: "Generate Prime",
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(label: "Bits:", controller: bitsController),
            isError
                ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please Enter a valid number",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.red),
                    ),
                  ),
                )
                : SizedBox.shrink(),
            SizedBox(height: 20),
            CustomTextField(label: "Cases:", controller: casesController),

            SizedBox(height: 40),
            CustomButton(
              label: "Submit",
              onPress: () {
                if (bitsController.text == "") {
                  setState(() {
                    isError = true;
                    submitted = false;
                  });
                } else {
                  setState(() {
                    isError = false;
                  });
                  try {
                    prime = generateLargePrime(
                      int.parse(bitsController.text),
                      casesController.text == ""
                          ? 5
                          : int.parse(bitsController.text),
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
            submitted
                ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Generated Prime Number: $prime",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.green),
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
