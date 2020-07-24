import 'Root.dart';

class Language {
  Map<String, dynamic> paradigms;
  List<Root> roots;

  Language(this.paradigms, this.roots);

  String glossToLang(String gloss) {
    var result = '';
    for (var word in gloss.toLowerCase().split(' ')) {
      var morphemes = word.split('-');
      Root root;
      int rootIndex;
      bool isRegularRoot;

      morphemes.asMap().forEach((index, morpheme) {
        var submorphemes = morpheme.split('.'); //I don't really know the word
        if (this.roots.any((root) => root.englishName == submorphemes[0])) {
          root = this.roots.getFromEnglish(submorphemes[0]);
          rootIndex = index;
          isRegularRoot = submorphemes.length == 1;
        }
      });

      void addMorphemes(int from, int to) {
        for (var i = from; i < to; i++)
          result += this.paradigms[root.paradigm][morphemes[i]];
      }

      if (isRegularRoot) {
        addMorphemes(0, rootIndex);
        result += root.rootName;
        addMorphemes(rootIndex + 1, morphemes.length);
      } else
        addMorphemes(0, morphemes.length);
      result += ' ';
    }
    return result.trim();
  }
}
