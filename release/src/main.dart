import 'dart:convert';
import 'dart:io';
import 'Language.dart';
import 'Root.dart';
import 'Constants.dart';

void main(List<String> args) async {
  List<Root> roots = [];
  Map<String, dynamic> paradigms;

  if (args.length != 3) {
    print(
        "gloss-to-lang requires exactly three arguments: the language.json file path, the language and the gloss string.");
    exit(1);
  }

  try {
    var ljson = jsonDecode(await File(args[0]).readAsString())[args[1]];
    for (var properties in ljson['roots']) roots.add(Root.argsList(properties));
    paradigms = ljson['paradigms'];
  } on NoSuchMethodError {
    print(GENERIC_ERROR_MESSAGE);
    exit(1);
  }

  var lang = Language(paradigms, roots);

  print(lang.glossToLang(args[2]));
}
