import 'dart:convert';

class TrainClassModel {
  final String? backgroundImage;
  final String title;
  TrainClassModel({
    required this.backgroundImage,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backgroundImage': backgroundImage,
      'title': title,
    };
  }

  factory TrainClassModel.fromMap(Map<String, dynamic> map) {
    return TrainClassModel(
      backgroundImage: map['backgroundImage'],
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainClassModel.fromJson(String source) => TrainClassModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TrainClassModel(backgroundImage: $backgroundImage, title: $title)';
}

List<TrainClassModel> trainClasses = [
  TrainClassModel(title: "Warm Up", backgroundImage: 'assets/images/Classes pics/warm up background.jpg'),
  TrainClassModel(title: 'Body Building', backgroundImage: 'assets/images/Classes pics/body building.jpg'),
];
