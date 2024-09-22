import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:clean_abs/home.screen.dart';
import 'package:clean_abs/routine.get_ready.screen.dart';
import 'package:clean_abs/routine.screen.dart';
import 'package:clean_abs/routine-timer.view.dart';
import 'package:clean_abs/stats.screen.dart';
import 'package:clean_abs/routine-complete.view.dart';
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
      path: '/routine/:id/get-ready',
      name: 'routine_get_ready',
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: RoutineGetReadyScreen(),
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
    GoRoute(
      path: '/stats',
      name: 'stats',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: StatsScreen(),
      ),
    ),
  ],
);
