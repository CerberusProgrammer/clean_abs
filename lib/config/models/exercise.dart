class Exercise {
  String name;
  String description;
  String? startImage;
  String? finalImage;
  int? repetitions;
  int? duration;

  Exercise({
    required this.name,
    required this.description,
    this.startImage,
    this.finalImage,
    required this.repetitions,
    required this.duration,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'startImage': startImage,
        'finalImage': finalImage,
        'repetitions': repetitions,
        'duration': duration,
      };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        name: json['name'],
        description: json['description'],
        startImage: json['startImage'],
        finalImage: json['finalImage'],
        repetitions: json['repetitions'],
        duration: json['duration'],
      );
}
