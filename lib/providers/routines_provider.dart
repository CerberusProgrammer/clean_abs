import 'package:clean_abs/config/models/routine.dart';
import 'package:clean_abs/config/data/routines.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routinesProvider = Provider<List<Routine>>((ref) {
  return routines;
});
