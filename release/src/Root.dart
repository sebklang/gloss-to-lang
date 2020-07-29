class Root {
  String rootName;
  String englishName;
  String paradigm;
  //other properties...

  Root(this.rootName, this.englishName, this.paradigm);
  Root.argsList(List<dynamic> args) : this(args[0], args[1], args[2]);
}

extension Gets on List<Root> {
  Root getFromRoot(String rootName) =>
      firstWhere((root) => root.rootName == rootName);

  Root getFromEnglish(String englishName) =>
      firstWhere((root) => root.englishName == englishName);
}
