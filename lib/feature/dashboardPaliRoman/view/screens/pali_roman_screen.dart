import 'package:flutter/services.dart';
import 'package:name_checker_app/core/helpers/helper_getx_controller.dart';
import 'package:name_checker_app/core/utils/pali_utils.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:name_checker_app/core/utils/utils.dart';

import 'package:flutter/material.dart';

class PaliRomanScreen extends StatefulWidget {
  final Map<String, String> mapping;
  const PaliRomanScreen({
    super.key,
    required this.mapping,
  });

  @override
  State<PaliRomanScreen> createState() => _PaliRomanScreenState();
}

class _PaliRomanScreenState extends State<PaliRomanScreen> {
  String inputText = '';
  String inputCodePoint = '';
  String outputText = '';
  final FocusNode _focusNode = FocusNode();

  void convertPaliToRoman(Map<String, String> wordDict) {
    String mappedString;
    // Step 1: Preprocess
    String processedText = preprocess(inputText);

    List<String> wordListSplitted = processedText.split(' ');

    mappedString = wordListSplitted
        .asMap()
        .entries
        .map((entry) => getMap(entry.value, wordDict))
        .join(' ');

    debugPrint(mappedString.toString());
    setState(() {
      inputCodePoint =
          inputText.runes.map((r) => r.toRadixString(16)).toList().toString();
      outputText = mappedString;
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ပါဠိ-ရိုမန်",
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
                  labelText: 'Enter P\u0101\u1e37i Text',
                  labelStyle: TextStyle(color: AppPallete.gradient6),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: AppPallete.whiteColor),
                onChanged: (value) {
                  inputText = normalizeText(value);
                  convertPaliToRoman(widget.mapping);
                },
              ),
              /* Focus(
                focusNode: _focusNode,
                child: GestureDetector(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Enter P\u0101\u1e37i Text',
                        labelStyle: TextStyle(color: AppPallete.gradient6),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: AppPallete.whiteColor),
                      onChanged: (value) {
                        inputText = normalizeText(value);
                        convertPaliToRoman(widget.mapping);
                      },
                    ),
                  ),
                ),
              ), */
              SizedBox(height: 20),
              Text(
                'Standardized Transliteration',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient6),
              ),
              /* SizedBox(height: 20),
            Text(
              inputCodePoint,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ), */
              SizedBox(height: 20),
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
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GentiumPlus",
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
            ],
          ),
        ),
      ),
    );
  }
}
