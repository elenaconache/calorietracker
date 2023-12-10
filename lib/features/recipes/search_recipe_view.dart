import 'package:calorietracker/features/recipes/recipe_item.dart';
import 'package:calorietracker/models/recipe.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchRecipeView extends StatefulWidget {
  const SearchRecipeView({Key? key}) : super(key: key);

  @override
  State<SearchRecipeView> createState() => _SearchRecipeViewState();
}

class _SearchRecipeViewState extends State<SearchRecipeView> {
  late final TextEditingController _searchFieldController;

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.recipesTitle)),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: SearchTextField(
                    labelText: AppStrings.searchRecipeLabel,
                    controller: _searchFieldController,
                    onSubmitted: (query) {},
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 28,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => RecipeItem(
                  recipe: Recipe(name: 'Mocked recipe #$index'),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
