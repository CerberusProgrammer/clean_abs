import 'package:clean_abs/config/models/exercise.dart';
import 'package:clean_abs/config/models/routine.dart';

List<Routine> routines = [
  Routine(
    name: 'Abs made Stone',
    description: 'A routine to make your abs as hard as stone',
    image: 'assets/images/abs_made_stone.jpg',
    difficulty: Difficulty.medium,
    type: [ExerciseType.full],
    duration: 15,
    restPerExercise: 10,
    restPerSet: 30,
    sets: 3,
    calories: 100,
    exercises: [
      Exercise(
        name: 'Crunch',
        description:
            'Lay down on your back, bend your knees and place your hands behind your head. Lift your shoulders off the ground and hold for a second. Slowly lower your shoulders back to the ground.',
        image: 'assets/images/crunch.jpg',
        repetitions: 15,
        duration: null,
      ),
      Exercise(
        name: 'Leg Raise',
        description:
            'Lay down on your back, place your hands under your glutes and lift your legs up. Slowly lower your legs back to the ground.',
        image: 'assets/images/leg_raise.jpg',
        repetitions: 15,
        duration: null,
      ),
      Exercise(
        name: 'Russian Twist',
        description:
            'Sit down on the ground, bend your knees and lift your legs up. Hold your hands together and twist your torso to the left and to the right.',
        image: 'assets/images/russian_twist.jpg',
        repetitions: 15,
        duration: null,
      ),
    ],
  )
];
