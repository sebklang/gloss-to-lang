A gloss-to-language translator intended for conlangs.

Required language features are entered in the `bin/languages.json` file. Each root is assigned a paradigm, which indicates how a word is inflected. This can include irregular inflection, as shown in the example. If the language uses different inflection in different locations of a sentence, it is recommended to use in-gloss cases.

The program requires two command-line arguments as strings:
1. The JSON file path containing language information. (use `_` to use the default `languages.json`)
2. The language to translate into, as specified in `languages.json`.
3. The gloss to translate.

As for the structure of `languages.json`: The top level is a map of languages. Every language in `languages.json` is itself a map that must contain two keys: `paradigms` and `roots`. Paradigms are maps from the relevant gloss identifier to the conlang translation. Roots are lists of three strings, in the order of: in-language root name, then identifier (name used in gloss), and finally the assigned paradigm.

Important: Irregularly inflected roots must have root identifier before the first dot.

However, irregularly inflected roots can still be inflected further using basic affixes. For example, if the word 'shout' is inflected using the following paradigm:
```json
{  
    "shout.2sg.gen": "yratim",  
    "3sg": "re"  
}
```
Then the gloss 'shout.2sg.gen-3sg' will translate to 'yratimre', as it should.

The gloss is not case-sensitive.

In the case of an error, make sure to control that the command-line arguments are in the right order, and that the gloss is compatible with the specified language.

Other than that, the example language in languages.json should be enough to understand how it works.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
