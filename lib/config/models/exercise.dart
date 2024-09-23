class Exercise {
  String name;
  String description;
  String image;
  int? repetitions;
  int? duration;

  Exercise({
    required this.name,
    required this.description,
    required this.image,
    required this.repetitions,
    required this.duration,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image': image,
        'repetitions': repetitions,
        'duration': duration,
      };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        repetitions: json['repetitions'],
        duration: json['duration'],
      );
}
