import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PhishingPredictionPage extends StatefulWidget {
  const PhishingPredictionPage({super.key});

  @override
  State<PhishingPredictionPage> createState() => _PhishingPredictionPageState();
}

class _PhishingPredictionPageState extends State<PhishingPredictionPage> {
  final TextEditingController urlController = TextEditingController();
  String? _result;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _isLoading = true;
      _result = null;
    });

    final dio = Dio();
    try {
      final response = await dio.post(
        'https://ram3ez-cybersec.hf.space/gradio_api/call/predict/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer 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',
          },
        ),
        data: {
          "data": [urlController.text],
        },
      );

      final result = response.data["event_id"].toString();

      final response2 = await dio.get(
        'https://ram3ez-cybersec.hf.space/gradio_api/call/predict/$result',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer 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',
          },
        ),
      );

      _result = response2.data.toString().split("\n")[1].toLowerCase();
      print(_result);
    } catch (e) {
      _result = "Error: $e";
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Phishing Link Predictor",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Enter URL",
              isNum: false,
              controller: urlController,
            ),
            SizedBox(height: 20),
            CustomButton(label: "Submit", onPress: _submit),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator(color: Theme.of(context).primaryColor)
            else if (_result != null) ...[
              Text(
                _result!.contains("legitimate")
                    ? "Legitimate URL"
                    : "Phishing URL",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color:
                      _result!.contains("phishing") ? Colors.red : Colors.green,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
