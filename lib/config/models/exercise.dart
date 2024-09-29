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

  Exercise copyWith({
    String? name,
    String? description,
    String? startImage,
    String? finalImage,
    int? repetitions,
    int? duration,
  }) {
    return Exercise(
      name: name ?? this.name,
      description: description ?? this.description,
      startImage: startImage ?? this.startImage,
      finalImage: finalImage ?? this.finalImage,
      repetitions: repetitions ?? this.repetitions,
      duration: duration ?? this.duration,
    );
  }

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
