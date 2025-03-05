import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:cyber_sec/components/custom_text_field.dart";
import "package:cyber_sec/functions/encryption.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key});

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  final TextEditingController decryptInputController = TextEditingController();
  final TextEditingController decryptOutputController = TextEditingController();
  bool isError = false;
  bool isDecryptError = false;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Steps for AES Encryption & Decryption:",
        body:
            """1. Generate a 256-bit encryption key from your password using SHA-256.
2. Encrypt the text using AES in CBC mode with a random 16-byte IV.
3. Concatenate the IV with the encrypted text and encode it in Base64.
4. To decrypt, decode the Base64 string, extract the IV, and decrypt using the same key.
5. Retrieve the original text.
""",
      ),
      title: "Encrypt/Decrypt",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              children: [
                // Encryption Section Header
                Text(
                  "AES Encryption",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                // Encryption description
                Text(
                  "Enter the text you want to encrypt. The app will securely encrypt your text using AES encryption.",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Input for plain text
                CustomTextField(
                  label: "Text:",
                  controller: inputController,
                  isNum: false,
                ),
                const SizedBox(height: 10),
                isError
                    ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Please enter some text to encrypt",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                // Output for encrypted text (read-only)
                CustomTextField(
                  label: "Encrypted Text",
                  controller: outputController,
                  readOnly: true,
                  isNum: false,
                ),
                const SizedBox(height: 20),
                // Encrypt button
                CustomButton(
                  label: "Encrypt",
                  onPress: () {
                    if (inputController.text.isEmpty) {
                      outputController.text = "";
                      setState(() {
                        isError = true;
                        submitted = false;
                      });
                    } else {
                      try {
                        outputController.text = encrypt(inputController.text);
                        setState(() {
                          isError = false;
                          submitted = true;
                        });
                      } catch (_) {
                        outputController.text = "";
                        setState(() {
                          isError = true;
                          submitted = false;
                        });
                      }
                    }
                  },
                ),
                const SizedBox(height: 30),
                Divider(color: Colors.white54),
                const SizedBox(height: 30),
                // Decryption Section Header
                Text(
                  "AES Decryption",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                // Decryption description
                Text(
                  "Enter the encrypted text below to decrypt it and retrieve the original plain text.",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Input for encrypted text (to be decrypted)
                CustomTextField(
                  label: "Encrypted Text:",
                  controller: decryptInputController,
                  isNum: false,
                ),
                const SizedBox(height: 10),
                isDecryptError
                    ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Please enter some text to decrypt",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                // Output for decrypted text (read-only)
                CustomTextField(
                  label: "Decrypted Text",
                  controller: decryptOutputController,
                  readOnly: true,
                  isNum: false,
                ),
                const SizedBox(height: 20),
                // Decrypt button
                CustomButton(
                  label: "Decrypt",
                  onPress: () {
                    if (decryptInputController.text.isEmpty) {
                      setState(() {
                        isDecryptError = true;
                        submitted = false;
                      });
                    } else {
                      try {
                        decryptOutputController.text = decrypt(
                          decryptInputController.text,
                        );
                        setState(() {
                          isDecryptError = false;
                          submitted = true;
                        });
                      } catch (_) {
                        setState(() {
                          isDecryptError = true;
                          submitted = false;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
