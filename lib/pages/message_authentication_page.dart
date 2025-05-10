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
        title: "What is Message Authentication?",
        body:
            """A Message Authentication Code (MAC) is a short piece of information used to verify the integrity and authenticity of a message.

It tells the receiver:

"This message has not been tampered with"
 "It came from someone who knows the shared secret key"

MACs are used in systems where the sender and receiver share a secret key.

How Does MAC Work?

 Sender Side:
Sender has a message M and a secret key K.
Sender runs a MAC algorithm using M and K.
The result is a MAC tag (e.g., T), which is sent along with the message.

 Receiver Side:
Receiver gets the message M and MAC tag T.
Using the same secret key K, they run the MAC algorithm again to compute a new MAC.
If their result matches the received MAC (T), the message is valid .

Formula (for HMAC):MAC = HMAC(K, M)
Where:
K = secret key
M = message
HMAC = Hash-based Message Authentication Code

Algorithm We Use: HMAC with SHA-256
HMAC = Hash-based MAC algorithm

SHA-256 = A secure hashing function

It produces a fixed-size output (256 bits) even if the message is large.

 Real-World Uses of MAC
 Verifying transactions in banking
 Secure message transfer in APIs
App tokens and cookies
 VPN and TLS protocols

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
