import 'package:flutter/services.dart';
import 'package:name_checker_app/core/helpers/helper_getx_controller.dart';
import 'package:name_checker_app/core/utils/mm_utils.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

import 'package:flutter/material.dart';
import 'package:name_checker_app/core/utils/utils.dart';

class MmEngScreen extends StatefulWidget {
  final Map<String, String> mapping;
  const MmEngScreen({
    super.key,
    required this.mapping,
  });

  @override
  State<MmEngScreen> createState() => _MmEngScreenState();
}

class _MmEngScreenState extends State<MmEngScreen> {
  String inputText = '';
  String inputCodePoint = '';
  String outputText = '';

  void convertName(Map<String, String> wordDict) {
    String mappedNames;

    // Step 1: Preprocess
    String processedText = preprocess(inputText);

    List<String> wordList = processedText.split(' ');
    mappedNames = wordList
        .asMap()
        .entries
        .map((entry) => getMap(entry.value, wordDict))
        .join(' ');

    setState(() {
      inputCodePoint = processedText.runes
          .map((r) => r.toRadixString(16))
          .toList()
          .toString();
      outputText = mappedNames.capitalize();
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "မြန်မာ-အင်္ဂလိပ်",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Myanmar Name',
                  labelStyle: TextStyle(color: AppPallete.gradient6),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: AppPallete.whiteColor),
                onChanged: (value) {
                  inputText = normalizeText(value);
                  convertName(widget.mapping);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Standardized Transcription',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient6),
              ),
              SizedBox(height: 20),
              /* Text(
              inputCodePoint,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), */
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: AppPallete.gradient7, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    outputText.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.whiteColor),
                  ),
                ),
              ),
              SizedBox(height: 20),
              outputText.isNotEmpty
                  ? SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final String textToCopy = outputText;
                          if (textToCopy.isNotEmpty) {
                            try {
                              await Clipboard.setData(
                                  ClipboardData(text: textToCopy));
                              HelperGetxController.successSnackBar(
                                  title: "Success",
                                  message: "Name copied to clipboard.");
                            } catch (e) {
                              HelperGetxController.errorSnackBar(
                                  title: "Oh Snap",
                                  message: "Failed to copy name.");
                            }
                          }
                        },
                        child: Text(
                          "Copy to Clipboard",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.gradient7,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
