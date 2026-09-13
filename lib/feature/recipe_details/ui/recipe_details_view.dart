import 'package:calorietracker/feature/recipe_details/logic/recipe_details_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/feature/recipes/ui/nutrition_tile.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_name_field.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_servings_field.dart';
import 'package:calorietracker/feature/recipes/ui/create_recipe/ingredient_item.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/recipe.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/app_divider.dart';
import 'package:calorietracker/ui/widgets/calories_macros_section.dart';
import 'package:calorietracker/ui/widgets/general_error_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsView extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsView({super.key, required this.recipe});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  late final ScrollController _scrollController;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameTextFieldController;
  late final TextEditingController _servingSizeTextController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _formKey = GlobalKey<FormState>(debugLabel: 'recipeDetailsForm');
    _nameTextFieldController = TextEditingController();
    _nameTextFieldController.text = widget.recipe.name;
    _servingSizeTextController = TextEditingController()
      ..text = widget.recipe.cookedWeight.toString()
      ..addListener(_onServingSizeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecipeDetailsCubit>().fetchRecipe(
        recipeId: widget.recipe.id,
        localRecipeId: widget.recipe.localId,
        cookedQuantity: widget.recipe.cookedWeight,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _nameTextFieldController.dispose();
    _servingSizeTextController
      ..removeListener(_onServingSizeChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.recipeDetailsTitle)),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: RecipeNameField(
                formKey: _formKey,
                textController: _nameTextFieldController,
                enabled: false,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: RecipeServingsField(
                textController: _servingSizeTextController,
                enabled: false,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 18, right: 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.summary100GramsMessage,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                BlocSelector<
                  RecipeDetailsCubit,
                  RecipeDetailsState,
                  AsyncState<Nutrition>
                >(
                  selector: (state) => state.nutrition,
                  builder: (context, state) {
                    return state.status.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      success: () {
                        final nutrition = state.data;
                        return nutrition == null
                            ? const SizedBox.shrink()
                            : Column(
                                children: [
                                  CaloriesMacrosSection(nutrition: nutrition),
                                  const AppDivider(height: 2),
                                  NutritionTile(nutrition: nutrition),
                                  const AppDivider(height: 2),
                                ],
                              );
                      },
                      failure: () => const GeneralErrorView(),
                    );
                  },
                ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16, left: 18, right: 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.ingredientsTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 16)),
          BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
            builder: (context, state) {
              return state.ingredients.status.when(
                initial: () => const SliverPadding(padding: EdgeInsets.zero),
                loading: () => const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                success: () => SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    final ingredient = state.ingredients.data?[index];
                    final food = state.ingredientsFoods.data?.firstWhereOrNull(
                      (element) => element.id == ingredient?.localFood.targetId,
                    );
                    if (ingredient == null || food == null) {
                      return const SizedBox.shrink();
                    }
                    return IngredientItem(
                      ingredient: ingredient,
                      food: Food.local(localFood: food),
                      onSwipe: () {},
                      onTap: () {},
                      enabled: false,
                    );
                  }, childCount: state.ingredients.data?.length ?? 0),
                ),
                failure: () =>
                    const SliverToBoxAdapter(child: GeneralErrorView()),
              );
            },
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 2 * MediaQuery.of(context).padding.bottom,
            ),
          ),
        ],
      ),
    );
  }

  void _onServingSizeChanged() {
    if (!mounted) return;
    context.read<RecipeDetailsCubit>().updateNutrition(
      cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
    );
  }
}
