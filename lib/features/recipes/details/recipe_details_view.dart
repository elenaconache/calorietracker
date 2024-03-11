import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/recipes/details/recipe_details_arguments.dart';
import 'package:calorietracker/features/recipes/details/recipe_details_controller.dart';
import 'package:calorietracker/features/recipes/recipe_name_field.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class RecipeDetailsView extends StatefulWidget {
  final RecipeDetailsArguments arguments;

  const RecipeDetailsView({super.key, required this.arguments});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  late final ScrollController _scrollController;
  late final RecipeDetailsController _controller;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameTextFieldController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = locator<RecipeDetailsController>();
    _formKey = GlobalKey<FormState>(debugLabel: 'recipeDetailsForm');
    _nameTextFieldController = TextEditingController();
    _nameTextFieldController.text = widget.arguments.recipeName;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.isLoading.dispose();
    _nameTextFieldController.dispose();
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
              child: ValueListenableBuilder(
                valueListenable: _controller.isLoading,
                builder: (_, isLoading, __) => RecipeNameField(
                  formKey: _formKey,
                  isLoading: isLoading,
                  textController: _nameTextFieldController,
                  enabled: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
