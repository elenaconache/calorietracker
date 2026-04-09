import 'package:calorietracker/feature/recipes/logic/create_recipe_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/recipes/ui/nutrition_tile.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_name_field.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_servings_field.dart';
import 'package:calorietracker/feature/recipes/ui/create_recipe/ingredient_item.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/app_divider.dart';
import 'package:calorietracker/ui/widgets/calories_macros_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRecipeView extends StatefulWidget {
  const CreateRecipeView({super.key});

  @override
  State<CreateRecipeView> createState() => _CreateRecipeViewState();
}

class _CreateRecipeViewState extends State<CreateRecipeView> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TextEditingController _servingSizeTextController;
  late final TextEditingController _nameTextFieldController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _formKey = GlobalKey<FormState>(debugLabel: 'createRecipeForm');
    _servingSizeTextController = TextEditingController()
      ..text = '100'
      ..addListener(_onServingSizeChanged);
    _nameTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _servingSizeTextController
      ..removeListener(_onServingSizeChanged)
      ..dispose();
    _nameTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateRecipeCubit, CreateRecipeState>(
      listener: (context, state) {
        _handleCreateRecipeResult(state.createRecipeStatus);
      },
      listenWhen: (previous, current) => previous.createRecipeStatus != current.createRecipeStatus,
      buildWhen: (previous, current) => previous.createRecipeStatus != current.createRecipeStatus,
      builder: (context, state) {
        final isLoading = state.createRecipeStatus.status is LoadingStatus;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.createRecipeTitle),
            actions: [
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                IconButton(onPressed: _saveRecipe, icon: const Icon(Icons.check, size: 32)),
            ],
          ),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: RecipeNameField(
                    formKey: _formKey,
                    enabled: !isLoading,
                    textController: _nameTextFieldController,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: RecipeServingsField(
                    textController: _servingSizeTextController,
                    enabled: !isLoading,
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
                child: BlocSelector<CreateRecipeCubit, CreateRecipeState, Nutrition>(
                  selector: (state) => state.nutrition,
                  builder: (context, state) => Column(
                    children: [
                      CaloriesMacrosSection(nutrition: state),
                      AppDivider(height: 2),
                      NutritionTile(nutrition: state),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: AppDivider(height: 2)),
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
              BlocSelector<CreateRecipeCubit, CreateRecipeState, List<RecipeIngredient>>(
                selector: (state) => state.ingredients,
                builder: (context, ingredients) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => IngredientItem(
                      ingredient: ingredients[index],
                      onSwipe: () => context.read<CreateRecipeCubit>().removeIngredient(
                            index: index,
                            cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
                          ),
                      onTap: () => _navigateToIngredientDetails(index),
                    ),
                    childCount: ingredients.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: TextButton(
                    onPressed: isLoading ? null : _navigateToSearchFood,
                    child: Text(AppStrings.addIngredientTitle.toUpperCase()),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToSearchFood() {
    Navigator.of(context).pushNamed(Routes.foodSearch.path).then((result) {
      if (result is RecipeIngredient) {
        _onIngredientAdded(result);
      }
    });
  }

  void _onIngredientAdded(RecipeIngredient result) {
    if (!mounted) return;
    context.read<CreateRecipeCubit>().addIngredient(
          ingredient: result,
          cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
        );
    FocusScope.of(context).unfocus();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + MediaQuery.of(context).padding.bottom,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onServingSizeChanged() {
    if (!mounted) return;
    context.read<CreateRecipeCubit>().updateCookedQuantity(
          cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
        );
  }

  void _saveRecipe() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!mounted) return;
      context.read<CreateRecipeCubit>().saveRecipe(
            cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 0,
            name: _nameTextFieldController.text,
          );
    }
  }

  void _handleCreateRecipeResult(AsyncState createRecipeResult) {
    if (!mounted) return;
    switch (createRecipeResult.status) {
      case SuccessStatus _:
        Navigator.of(context).pop();
        break;
      case FailureStatus _:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppStrings.errorCreatingRecipeMessage)));
      default:
    }
  }

  void _navigateToIngredientDetails(int index) async {
    if (!mounted) return;
    final cubit = context.read<CreateRecipeCubit>();
    final ingredient = cubit.state.ingredients[index];
    final result = await Navigator.of(context).pushNamed(
      Routes.addFood.path,
      arguments: AddFoodArguments(
        meal: null,
        food: ingredient.food,
        localFoodId: ingredient.food.localFood.id,
        servingSize: ingredient.servingQuantity,
      ),
    );
    if (result is RecipeIngredient) {
      cubit.updateIngredientQuantity(
        index: index,
        ingredientQuantity: result.servingQuantity,
        cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
      );
    }
  }
}
