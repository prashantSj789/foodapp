import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/models/meal.dart';

class favoritemealsnotifier extends StateNotifier<List<Meal>> {
  favoritemealsnotifier() : super([]);
 bool togglemealfavoritestatus(Meal meal)
 {
  final mealIsfavorite = state.contains(meal);
  if(mealIsfavorite)
  {
    state=state.where((m) => m.id != meal.id).toList();
    return false;
  }
  else{
    state = [...state, meal];
    return true;
  }
 }
}
final favoritemealsprovider = StateNotifierProvider<favoritemealsnotifier,List<Meal>>((ref) {
  return favoritemealsnotifier();
} );