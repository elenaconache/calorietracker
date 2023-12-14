import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/recipes/recipe_item.dart';
import 'package:calorietracker/features/recipes/search_recipe_controller.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/recipe.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:calorietracker/ui/components/text_field/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchRecipeView extends StatefulWidget {
  const SearchRecipeView({Key? key}) : super(key: key);

  @override
  State<SearchRecipeView> createState() => _SearchRecipeViewState();
}

class _SearchRecipeViewState extends State<SearchRecipeView> {
  late final TextEditingController _searchFieldController;
  late final SearchRecipeController _controller;

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController()..addListener(_onSearchQueryChanged);
    _controller = locator<SearchRecipeController>();
  }

  @override
  void dispose() {
    _searchFieldController.removeListener(_onSearchQueryChanged);
    _searchFieldController.dispose();
    _controller.recipes.dispose();
    super.dispose();
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
                    onSubmitted: (query) => _controller.searchRecipe(query: query),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 28,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: _onCreateRecipePressed,
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 12),
            const AppDivider(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _controller.recipes,
                builder: (_, recipes, __) {
                  return switch (recipes) {
                    FutureLoading _ => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    FutureError _ => const Center(child: GeneralErrorView()),
                    FutureSuccess<List<Recipe>> response => response.data.isEmpty
                        ? const EmptyView()
                        : ListView.builder(
                            itemBuilder: (context, index) => RecipeItem(
                              recipe: response.data[index],
                              showTopDivider: index != 0,
                            ),
                            itemCount: response.data.length,
                          ),
                    FutureInitialState _ => const SizedBox.shrink(),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchQueryChanged() {
    if (_searchFieldController.text.isEmpty) {
      _controller.clearResults();
    }
  }

  void _onCreateRecipePressed() => Navigator.of(context).pushNamed(Routes.createRecipe.name);
}
