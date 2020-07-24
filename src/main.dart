import 'dart:convert';
import 'dart:io';
import 'Language.dart';
import 'Root.dart';

void main(List<String> args) async {
  List<Root> roots = [];
  var paradigms;

  try {
    var ljson = jsonDecode(
        await File('resource/languages.json').readAsString())[args[0]];
    for (var args in ljson['roots']) roots.add(Root.argsList(args));
    paradigms = ljson['paradigms'];
  } on NoSuchMethodError {
    print('Something went wrong. Please read the README for instructions.');
  }

  var lang = Language(paradigms, roots);

  print(lang.glossToLang(args[1]));
}
