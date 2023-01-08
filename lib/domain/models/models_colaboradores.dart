class DataModel {
  final String title;
  final String imageName;
  final double seguidores;
  DataModel(
    this.title,
    this.imageName,
    this.seguidores,
  );
}

List<DataModel> dataList = [
  DataModel('Nela', 'assets/images/nela.jpg', 830.089),
  DataModel('Skross', 'assets/images/skros.jpg', 229.452),
  DataModel('Neoshaggy', 'assets/images/neoshaggy.jpg', 168.872),
  DataModel('Charly Cox', 'assets/images/charly.jpg', 523.697),
  DataModel('Mr. Choco', 'assets/images/mr.choco.jpg', 723.697),
  DataModel('Biyin', 'assets/images/biyin.jpg', 823.697),
];
