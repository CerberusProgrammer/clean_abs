import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:clean_abs/pages/exercises/exercise.view.dart';
import 'package:clean_abs/pages/exercises/exercises.screen.dart';
import 'package:clean_abs/pages/home.screen.dart';
import 'package:clean_abs/pages/routines/routine.screen.dart';
import 'package:clean_abs/pages/routines/routine-timer.view.dart';
import 'package:clean_abs/pages/stats/stats.screen.dart';
import 'package:clean_abs/pages/routines/routine-complete.view.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
        path: "/exercises",
        name: "exercises",
        pageBuilder: (context, state) => const NoTransitionPage(
              child: ExercisesScreen(),
            ),
        routes: [
          GoRoute(
            path: ":name",
            pageBuilder: (context, state) {
              final name = state.pathParameters['name']!;
              return NoTransitionPage(
                child: ExerciseView(name: name),
              );
            },
          ),
        ]),
    GoRoute(
      path: '/stats',
      name: 'stats',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: StatsScreen(),
      ),
    ),
    GoRoute(
      path: '/routine/:id',
      name: 'routine',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return NoTransitionPage(
          child: RoutineScreen(id: id),
        );
      },
    ),
    GoRoute(
      path: '/routine/:id/workout',
      name: 'routine_workout',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return NoTransitionPage(
          child: RoutineTimerView(id: id),
        );
      },
    ),
    GoRoute(
      path: '/routine/:id/complete',
      name: 'routine_complete',
      pageBuilder: (context, state) {
        final routineStat = state.extra as RoutineStat;
        return NoTransitionPage(
          child: RoutineCompleteView(routineStat: routineStat),
        );
      },
    ),
  ],
);
