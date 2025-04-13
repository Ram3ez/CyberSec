import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:cyber_sec/components/custom_text_field.dart";
import "package:cyber_sec/functions/encryption.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

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
  bool isException = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Steps for AES Encryption & Decryption:",
        body: """1. Generate a 256-bit encryption key from the password.
     - Use SHA-256 hashing on the password to derive a secure key.

  2. Encrypt the text using AES (CBC mode).
     - Generate a random IV (Initialization Vector) of 16 bytes.
     - Encrypt the text using AES with the generated key and IV.
     - Concatenate IV with the encrypted text and encode it in Base64.

  3. Decrypt the encrypted text.
     - Decode the Base64-encoded input.
     - Extract the IV (first 16 bytes) and the encrypted data.
     - Decrypt using the same key and IV.

  4. Return the decrypted plain text.""",
      ),
      title: "Encrypt/Decrypt",
      child: Container(
        padding: EdgeInsets.all(10),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CustomTextField(
                label: "Text:",
                controller: inputController,
                isNum: false,
              ),
              isError
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please Enter Some Text",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.red),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              SizedBox(height: 10),
              CustomTextField(
                label: "Encrypted Text",
                controller: outputController,
                readOnly: true,
                isNum: false,
                iconFunction: () {
                  Clipboard.setData(ClipboardData(text: outputController.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Durations.long4,
                      backgroundColor: Theme.of(context).canvasColor,
                      content: Text(
                        "Copied to clipboard",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                label: "Encrypt",
                onPress: () {
                  if (inputController.text == "") {
                    outputController.text = "";
                    setState(() {
                      isError = true;
                      submitted = false;
                    });
                  } else {
                    try {
                      outputController.text = Encryption.encrypt(
                        inputController.text,
                      );
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
              Spacer(),
              Divider(),
              Spacer(),
              CustomTextField(
                label: "Encrypted Text:",
                controller: decryptInputController,
                isNum: false,
                iconFunction: () async {
                  var data = await Clipboard.getData(Clipboard.kTextPlain);
                  decryptInputController.text = data!.text ?? "";
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Durations.long4,
                      backgroundColor: Theme.of(context).cardColor,
                      content: Text(
                        "Pasted from clipboard",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              isDecryptError && !isException
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please Enter Some Text",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.red),
                      ),
                    ),
                  )
                  : isException
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Unexpected Error",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.red),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
              SizedBox(height: 10),
              CustomTextField(
                label: "Decrypted Text",
                controller: decryptOutputController,
                readOnly: true,
                isNum: false,
              ),
              SizedBox(height: 15),
              CustomButton(
                label: "Decrypt",
                onPress: () {
                  if (decryptInputController.text == "") {
                    setState(() {
                      isDecryptError = true;
                      isException = false;
                      submitted = false;
                    });
                  } else {
                    try {
                      decryptOutputController.text = Encryption.decrypt(
                        decryptInputController.text,
                      );
                      setState(() {
                        isDecryptError = false;
                        isException = false;
                        submitted = true;
                      });
                    } catch (_) {
                      setState(() {
                        isDecryptError = true;
                        submitted = false;
                        isException = true;
                      });
                    }
                  }
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
