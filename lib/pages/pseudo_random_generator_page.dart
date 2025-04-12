import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:cyber_sec/components/custom_slider.dart";
import "package:cyber_sec/functions/pseudo_random_generator.dart";
import "package:flutter/material.dart";

class PseudoRandomGeneratorPage extends StatefulWidget {
  PseudoRandomGeneratorPage({super.key});
  double minValue = 0.0;
  double maxValue = 100;
  int? randomNum;
  String result = "";
  bool submitted = false;
  bool isError = false;

  @override
  State<PseudoRandomGeneratorPage> createState() =>
      _PseudoRandomGeneratorPageState();
}

class _PseudoRandomGeneratorPageState extends State<PseudoRandomGeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Pseudo Random Number Generator",
        body: '''What is a PRNG?
A Pseudo-Random Number Generator (PRNG) is a program or algorithm that generates a sequence of numbers that appear random but are actually completely determined by an initial value known as the seed.

PRNGs are deterministic, meaning if you give the same seed, you’ll get the same sequence every time.
Seed: The Starting Point
The seed is the input to the PRNG algorithm. Different seeds produce different sequences.

 Common PRNG Formula
One simple and widely used PRNG method is called the Linear Congruential Generator (LCG).

LCG Formula:Xₙ₊₁ = (a × Xₙ + c) mod m
where,
Xₙ is the Nth term in the sequence
X0: the seed (initial value)
a: multiplier
c: increment
m: modulus

PRNGs are not safe for encryption or secure applications - they are predictable.
If you need randomness for cryptography, use CSPRNG (Cryptographically Secure PRNG) instead.

''',
      ),
      title: "Random Number Generator",
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSlider(
                sliderValue: widget.minValue,
                label: "Minimum Value",
                onChanged: (double val) {
                  setState(() {
                    widget.minValue = val;
                  });
                },
              ),
              CustomSlider(
                sliderValue: widget.maxValue,
                label: "Maximum Value",
                onChanged: (double val) {
                  setState(() {
                    widget.maxValue = val;
                  });
                },
              ),
              CustomButton(
                label: "Generate Random Number",
                onPress: () {
                  try {
                    widget.isError = false;
                    if (widget.maxValue < widget.minValue) {
                      widget.isError = true;
                    }
                    setState(() {
                      widget.submitted = true;
                      widget.randomNum = pseudoRandomNumber(
                        widget.minValue.toInt(),
                        widget.maxValue.toInt(),
                      );
                    });
                  } on RangeError catch (e) {
                    widget.submitted = true;
                    widget.isError = true;
                    setState(() {});
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              widget.submitted && !widget.isError
                  ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Generated Random Number: ${widget.randomNum}",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.green),
                    ),
                  )
                  : widget.isError
                  ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Invalid Range",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.red),
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
