class TrainClassModel {
  final String backgroundImage;
  final String title;

  TrainClassModel({required this.title, required this.backgroundImage});

  factory TrainClassModel.fromJson(jsonData) {
    return TrainClassModel(
      title: jsonData['title'],
      backgroundImage: jsonData['backgroundImage'],
    );
  }
}

List<TrainClassModel> trainClasses = [
  TrainClassModel(title: "Warm Up", backgroundImage: 'assets/images/Classes pics/warm up background.jpg'),
  TrainClassModel(title: 'Body Building', backgroundImage: 'assets/images/Classes pics/body building.jpg'),
];
