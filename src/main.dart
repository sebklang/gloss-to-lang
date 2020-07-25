import 'dart:convert';
import 'dart:io';
import 'Language.dart';
import 'Root.dart';
import 'Constants.dart';

void main(List<String> args) async {
  List<Root> roots = [];
  var paradigms;

  if (args.length != 2) {
    print(
        "gloss-to-lang requires exactly two arguments: the language and the gloss string.");
    exit(1);
  }

  try {
    var ljson =
        jsonDecode(await File('bin/languages.json').readAsString())[args[0]];
    for (var properties in ljson['roots']) roots.add(Root.argsList(properties));
    paradigms = ljson['paradigms'];
  } on NoSuchMethodError {
    print(ERROR_MESSAGE);
    exit(1);
  }

  var lang = Language(paradigms, roots);

  print(lang.glossToLang(args[1]));
}
