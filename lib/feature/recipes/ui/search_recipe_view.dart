import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_item.dart';
import 'package:calorietracker/feature/recipes/logic/search_recipe_controller.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/recipe.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:calorietracker/ui/components/text_field/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchRecipeView extends StatefulWidget {
  const SearchRecipeView({super.key});

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
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_controller.fetchRecipes()));
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
                    FutureLoading _ => const Center(child: CircularProgressIndicator()),
                    FutureError _ => RefreshIndicator(
                        onRefresh: () => _searchFieldController.text.isEmpty
                            ? _controller.fetchRecipes()
                            : _controller.searchRecipe(query: _searchFieldController.text),
                        child: ListView(children: const [Center(child: GeneralErrorView())])),
                    FutureSuccess<List<Recipe>> response => RefreshIndicator(
                        onRefresh: () => _searchFieldController.text.isEmpty
                            ? _controller.fetchRecipes()
                            : _controller.searchRecipe(query: _searchFieldController.text),
                        child: response.data.isEmpty
                            ? ListView(children: const [EmptyView()])
                            : ListView.builder(
                                itemBuilder: (context, index) => RecipeItem(
                                  recipe: response.data[index],
                                  showTopDivider: index != 0,
                                ),
                                itemCount: response.data.length,
                              ),
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
