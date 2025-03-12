import "package:unorm_dart/unorm_dart.dart" as unorm;

String getRawUnicode(String text) {
  return text.runes
      .map((rune) => '\\u${rune.toRadixString(16).toUpperCase()}')
      .join('');
}

String normalizeText(String text) {
  return unorm.nfc(text);
}

String splitPrefixName(String text, List<String> prefixes) {
  for (var prefix in prefixes) {
    if (text.startsWith(prefix)) {
      return prefix;
    }
  }
  return text;
}

List<String> getSyllable(String label, String burmeseConsonant, String others) {
  RegExp regExp = RegExp(
    r"(?<![္])([" + burmeseConsonant + r"])(?![်္ ့])|([" + others + r"])",
    unicode: true,
  );

  String regLabel = label.replaceAllMapped(regExp, (match) {
    // Ensure null safety for optional groups
    String part1 = match.group(1) ?? "";
    String part2 = match.group(2) ?? "";
    return " $part1$part2";
  }).trim();

  RegExp regExp2 = RegExp(r"([က-ၴ])([a-zA-Z0-9])", unicode: true);

  regLabel = regLabel.replaceAllMapped(regExp2, (match) {
    return "${match.group(1)} ${match.group(2)}";
  });

  RegExp regExp3 = RegExp(r'([0-9၀-၉])\s+([0-9၀-၉])\s*', unicode: true);

  regLabel = regLabel.replaceAllMapped(regExp3, (match) {
    return "${match.group(1)}${match.group(2)}";
  });

  RegExp regExp4 = RegExp(r'([0-9၀-၉])\s+(\+)', unicode: true);

  regLabel = regLabel.replaceAllMapped(regExp4, (match) {
    return "${match.group(1)}${match.group(2)}";
  }).trim();

  return regLabel.split(' ');
}

List<String> syllableSplit(String label) {
  String burmeseConsonant = 'ကခဂဃငစဆဇဈညဉဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟဠအ';
  String others = r'ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-/:-@[-`{-~\s.,';

  return label
      .split(' ')
      .expand((word) => [...getSyllable(word, burmeseConsonant, others)])
      .toList();

  // return getSyllable(label, burmeseConsonant, others);
  // return labelSyllable.sublist(0, labelSyllable.length - 1);
}

List<String> mergeConsecutive(List<String> lst, Map<String, String> mapping) {
  List<String> newList = [];
  int i = 0;
  int maxLength = mapping.keys
      .fold(0, (maxLen, key) => key.length > maxLen ? key.length : maxLen);

  while (i < lst.length) {
    bool matchFound = false;

    // Check for the longest possible match (maxLength -> 2)
    for (int length =
            (maxLength < (lst.length - i) ? maxLength : (lst.length - i));
        length >= 2;
        length--) {
      String substring =
          lst.sublist(i, i + length).join(""); // Join consecutive elements
      if (mapping.containsKey(substring)) {
        // newList.add(mapping[substring]!); // Replace with mapped value
        newList.add(substring); // Replace with mapped key
        i += length; // Skip the matched elements
        matchFound = true;
        break; // Stop checking shorter lengths if match found
      }
    }

    if (!matchFound) {
      newList.add(lst[i]); // Keep the current element
      i += 1; // Move to the next element
    }
  }
  return newList;
}
