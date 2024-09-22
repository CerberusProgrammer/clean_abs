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
  ),
  Routine(
    name: 'Abs & Cardio',
    description: 'A routine to make your abs and improve your cardio',
    image: 'assets/images/abs_cardio.jpg',
    difficulty: Difficulty.hard,
    type: [ExerciseType.full],
    duration: 30,
    restPerExercise: 10,
    restPerSet: 30,
    sets: 3,
    calories: 200,
    exercises: [
      Exercise(
        name: 'Mountain Climber',
        description:
            'Start in a push-up position, bring your right knee to your chest and then quickly switch to bring your left knee to your chest.',
        image: 'assets/images/mountain_climber.jpg',
        repetitions: 15,
        duration: null,
      ),
      Exercise(
        name: 'Plank',
        description:
            'Start in a push-up position, but with your elbows on the ground. Keep your body straight and hold this position.',
        image: 'assets/images/plank.jpg',
        repetitions: null,
        duration: 30,
      ),
      Exercise(
        name: 'Burpee',
        description:
            'Start standing, then squat down and place your hands on the ground. Kick your legs back and do a push-up. Bring your legs back to your chest and jump up.',
        image: 'assets/images/burpee.jpg',
        repetitions: 10,
        duration: null,
      ),
    ],
  ),
  Routine(
    name: 'Stop boring abs',
    description: 'A routine to make funny your abs',
    image: 'assets/images/stop_boring_abs.jpg',
    difficulty: Difficulty.medium,
    type: [ExerciseType.full],
    duration: 15,
    restPerExercise: 10,
    restPerSet: 30,
    sets: 1,
    calories: 100,
    exercises: [
      Exercise(
        name: 'Dance Crunch',
        description:
            'Lay down on your back, bend your knees and place your hands behind your head. Lift your shoulders off the ground and perform a crunch while moving your legs as if you are dancing.',
        image: 'assets/images/dance_crunch.jpg',
        repetitions: 20,
        duration: null,
      ),
      Exercise(
        name: 'Hula Hoop Twist',
        description:
            'Stand up and hold a hula hoop around your waist. Twist your torso to the left and to the right while keeping the hula hoop spinning.',
        image: 'assets/images/hula_hoop_twist.jpg',
        repetitions: null,
        duration: 60,
      ),
      Exercise(
        name: 'Jumping Jack Plank',
        description:
            'Start in a plank position. Jump your feet out wide and then back together while maintaining the plank position.',
        image: 'assets/images/jumping_jack_plank.jpg',
        repetitions: 15,
        duration: null,
      ),
    ],
  ),
];
