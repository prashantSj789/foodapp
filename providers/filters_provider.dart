import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/models/meal.dart';
import './meals_provider.dart';
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
FiltersNotifier():super({
Filter.glutenFree: false,
Filter.lactoseFree: false,
Filter.vegetarian: false,
Filter.vegan: false
});
void setFilters(Map<Filter,bool> chosenFilters)
{
  state= chosenFilters;
} 
void setFilter(Filter filter, bool isActive)
{
  state= {
    ...state,
    filter: isActive,
  };
}

}
final FiltersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) => FiltersNotifier());

final filteredMealProvider = Provider((ref) {
   final meals= ref.watch(mealsprovider);
    final avaailablefilters=ref.watch(FiltersProvider);
    return meals.where((meal){
      if (avaailablefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (avaailablefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (avaailablefilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (avaailablefilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
   } ).toList();
   });

