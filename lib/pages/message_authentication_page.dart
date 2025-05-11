import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_navigation_bar.dart';
import 'package:cyber_sec/pages/hmac_generation_page.dart';
import 'package:cyber_sec/pages/verify_hmac_page.dart';
import 'package:flutter/material.dart';

class MessageAuthenticationPage extends StatefulWidget {
  const MessageAuthenticationPage({super.key});

  @override
  State<MessageAuthenticationPage> createState() =>
      _MessageAuthenticationPageState();
}

class _MessageAuthenticationPageState extends State<MessageAuthenticationPage> {
  int index = 0;

  List<Widget> pages = [HmacGenerationPage(), VerifyHmacPage()];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "What is HMAC?",
        body: """
HMAC stands for Hash-based Message Authentication Code. It is a technique used to verify the integrity and authenticity of a message. In simple terms, HMAC helps you check if a message was really sent by someone you trust and was not changed along the way.

 How HMAC Works
You have a message (like: "Transfer ₹1000").

You and the receiver share a secret key (like: "mySecretKey").

The app uses a hashing function (e.g., SHA-256) to create a special fingerprint (called HMAC) of the message and the key combined.

This HMAC is sent along with the message.

The receiver uses the same key to recalculate the HMAC and checks if it matches.

If it matches → ✅ the message is authentic and unchanged.

If it doesn’t → ❌ the message was tampered with or the sender is not trusted.


How HMAC Works (Step-by-Step)
Prepare the key:

If the key is too long, it's first hashed to shorten it.

If it's too short, it's padded with extra bytes to reach a fixed size (like 64 bytes for SHA-256).

""",
      ),
      title: "Message Authentication",
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: CustomNavigationBar(
          index: index,
          onSelected: (value) {
            index = value;
            setState(() {});
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.security_rounded),
              label: "HMAC",
            ),
            NavigationDestination(
              icon: Icon(Icons.verified_rounded),
              label: "VERIFY",
            ),
          ],
        ),
      ),
    );
  }
}
