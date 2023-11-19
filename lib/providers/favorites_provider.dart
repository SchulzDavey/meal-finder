import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_finder/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (!isExisting) {
      state = [...state, meal];
      return true;
    } else {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
  }
}

final favoritesMealProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
