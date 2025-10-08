import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/functions/switch_page.dart';
import 'package:cyber_sec/pages/deep_learning_model_page.dart';
import 'package:cyber_sec/pages/machine_learning_model_page.dart';
import 'package:flutter/material.dart';

class PhishingPredictionPage extends StatelessWidget {
  const PhishingPredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Phishing Link Prediction",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            CustomButton(
              label: "Machine Learning Model",
              onPress: SwitchPage.switchPage(
                context,
                MachineLearningModelPage(),
              ),
            ),
            CustomButton(
              label: "Deep Learning Model",
              onPress: SwitchPage.switchPage(context, DeepLearningModelPage()),
            ),
          ],
        ),
      ),
    );
  }
}
