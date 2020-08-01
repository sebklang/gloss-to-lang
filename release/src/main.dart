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

  String langsFilePath;
  if (args[0] == '_')
    langsFilePath = 'languages.json';
  else
    langsFilePath = args[0];
  String langName = args[1];
  String gloss = args[2];

  try {
    var ljson = jsonDecode(await File(langsFilePath).readAsString())[langName];
    for (var properties in ljson['roots']) roots.add(Root.argsList(properties));
    paradigms = ljson['paradigms'];
  } on NoSuchMethodError {
    print(GENERIC_ERROR_MESSAGE);
    exit(1);
  } on FileSystemException {
    print('Cannot find language file "$langsFilePath".');
  }

  var lang = Language(paradigms, roots);

  print(lang.glossToLang(gloss));
}
