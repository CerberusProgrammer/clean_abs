import 'package:clean_abs/config/models/exercise.dart';

final List<Exercise> exercises = [
  crunch,
  legRaise,
  russianTwist,
  mountainClimber,
  plank,
  burpee,
  danceCrunch,
  hulaHoopTwist,
  jumpingJackPlank,
  kneeToElbow,
  plankWithLegLift,
  plankWithArmLift,
  spidermanPlank,
  plankWithHipDip,
  plankWithLegTouchElbows,
  plankWithGetUp,
  plankWithLegTouchHand,
  plankWithHandTouchShoulder,
];

final Exercise crunch = Exercise(
  name: 'Crunch',
  description:
      'Lay down on your back, bend your knees and place your hands behind your head. Lift your shoulders off the ground and hold for a second. Slowly lower your shoulders back to the ground.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 15,
  duration: null,
);

final Exercise legRaise = Exercise(
  name: 'Leg Raise',
  description:
      'Lay down on your back, place your hands under your glutes and lift your legs up. Slowly lower your legs back to the ground.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/leg_raise.png',
  repetitions: 15,
  duration: null,
);

final Exercise russianTwist = Exercise(
  name: 'Russian Twist',
  description:
      'Sit down on the ground, bend your knees and lift your legs up. Hold your hands together and twist your torso to the left and to the right.',
  startImage: 'assets/russian_twist_left.png',
  finalImage: 'assets/russian_twist_right.png',
  repetitions: 15,
  duration: null,
);

final Exercise mountainClimber = Exercise(
  name: 'Mountain Climber',
  description:
      'Start in a push-up position, bring your right knee to your chest and then quickly switch to bring your left knee to your chest.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 15,
  duration: null,
);

final Exercise plank = Exercise(
  name: 'Plank',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and hold this position.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 30,
);

final Exercise burpee = Exercise(
  name: 'Burpee',
  description:
      'Start standing, then squat down and place your hands on the ground. Kick your legs back and do a push-up. Bring your legs back to your chest and jump up.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);

final Exercise danceCrunch = Exercise(
  name: 'Dance Crunch',
  description:
      'Lay down on your back, bend your knees and place your hands behind your head. Lift your shoulders off the ground and perform a crunch while moving your legs as if you are dancing.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 20,
  duration: null,
);

final Exercise hulaHoopTwist = Exercise(
  name: 'Hula Hoop Twist',
  description:
      'Stand up and hold a hula hoop around your waist. Twist your torso to the left and to the right while keeping the hula hoop spinning.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 60,
);

final Exercise jumpingJackPlank = Exercise(
  name: 'Jumping Jack Plank',
  description:
      'Start in a plank position. Jump your feet out wide and then back together while maintaining the plank position.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 15,
  duration: null,
);

final Exercise kneeToElbow = Exercise(
  name: 'Knee to Elbow',
  description:
      'Lay down on your back, bend your knees and place your hands behind your head. Lift your shoulders off the ground and bring your right elbow to your left knee. Switch sides.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);

final Exercise plankWithLegLift = Exercise(
  name: 'Plank with Leg Lift',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and lift one leg up. Hold this position.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 15,
);

final Exercise plankWithArmLift = Exercise(
  name: 'Plank with Arm Lift',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and lift one arm up. Hold this position.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 15,
);

final Exercise spidermanPlank = Exercise(
  name: 'Spiderman Plank',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and bring your right knee to your right elbow. Switch sides.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 15,
);

final Exercise plankWithHipDip = Exercise(
  name: 'Plank with Hip Dip',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and dip your hips to the left and to the right.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: null,
  duration: 15,
);

final Exercise plankWithLegTouchElbows = Exercise(
  name: 'Plank & Leg touch elbows',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and touch your left elbow with your right knee. Switch sides.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);

final Exercise plankWithGetUp = Exercise(
  name: 'Plank & Get up',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and get up. Go back to the initial position.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);

final Exercise plankWithLegTouchHand = Exercise(
  name: 'Plank & Leg touch hand',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and touch your left hand with your right foot. Switch sides.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);

final Exercise plankWithHandTouchShoulder = Exercise(
  name: 'Plank & Hand touch shoulder',
  description:
      'Start in a push-up position, but with your elbows on the ground. Keep your body straight and touch your left shoulder with your right hand. Switch sides.',
  startImage: 'assets/laydown.png',
  finalImage: 'assets/crunch.png',
  repetitions: 10,
  duration: null,
);
