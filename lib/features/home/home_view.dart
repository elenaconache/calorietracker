import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/add_food/add_food_view.dart';
import 'package:calorietracker/features/create_food/create_food_view.dart';
import 'package:calorietracker/features/diary/diary_view.dart';
import 'package:calorietracker/features/login/login_view.dart';
import 'package:calorietracker/features/profile/accounts/accounts_view.dart';
import 'package:calorietracker/features/profile/profile_view.dart';
import 'package:calorietracker/features/profile/user_goals/user_goals_view.dart';
import 'package:calorietracker/features/recipes/create_recipe/create_recipe_view.dart';
import 'package:calorietracker/features/recipes/details/recipe_details_arguments.dart';
import 'package:calorietracker/features/recipes/details/recipe_details_view.dart';
import 'package:calorietracker/features/recipes/search_recipe_view.dart';
import 'package:calorietracker/features/search_food/search_food_view.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/generic_error_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final diaryNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'diary');
final recipeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'recipe');

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.edit_calendar))),
          BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.cookie_sharp))),
        ],
        iconSize: 28,
        height: 36,
        inactiveColor: Theme.of(context).disabledColor,
        activeColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            onGenerateRoute: _onGenerateDiaryRoute,
            builder: (context) => const DiaryView(),
            navigatorKey: diaryNavigatorKey,
          );
        } else if (index == 1) {
          return CupertinoTabView(
            builder: (context) => const SearchRecipeView(),
            onGenerateRoute: _onGenerateRecipesRoute,
            navigatorKey: recipeNavigatorKey,
          );
        }
        locator<LoggingService>().info('Unknown tab accessed in bottom navigation at index $index');
        return CupertinoTabView(builder: (context) => const GenericErrorView());
      },
    );
  }

  Route? _onGenerateDiaryRoute(RouteSettings settings) {
    final matchingRoute = Routes.values.firstWhereOrNull((route) => route.path == settings.name);
    final args = settings.arguments;
    switch (matchingRoute) {
      case Routes.diary:
        return MaterialPageRoute(builder: (context) => const DiaryView());
      case Routes.foodSearch:
        return MaterialPageRoute(builder: (context) => SearchFoodView(meal: args as Meal));
      case Routes.addFood:
        return MaterialPageRoute(builder: (context) => AddFoodView(args: args as AddFoodArguments));
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.accounts:
        return MaterialPageRoute(builder: (context) => const AccountsView());
      case Routes.createFood:
        return MaterialPageRoute(builder: (context) => CreateFoodView(meal: args as Meal?));
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case Routes.userGoals:
        return MaterialPageRoute(builder: (context) => const UserGoalsView());
      default:
        return MaterialPageRoute(
          builder: (context) => GenericErrorView(
            buttonText: AppStrings.diaryTitle,
            onButtonPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.diary.path,
              (_) => false,
            ),
          ),
        );
    }
  }

  Route? _onGenerateRecipesRoute(RouteSettings settings) {
    final matchingRoute = Routes.values.firstWhereOrNull((route) => route.path == settings.name);
    final args = settings.arguments;
    switch (matchingRoute) {
      case Routes.recipes:
        return MaterialPageRoute(builder: (context) => const SearchRecipeView());
      case Routes.createRecipe:
        return MaterialPageRoute(builder: (context) => const CreateRecipeView());
      case Routes.recipe:
        return MaterialPageRoute(builder: (context) => RecipeDetailsView(arguments: args as RecipeDetailsArguments));
      case Routes.foodSearch:
        return MaterialPageRoute(builder: (context) => const SearchFoodView());
      case Routes.addFood:
        return MaterialPageRoute(builder: (context) => AddFoodView(args: args as AddFoodArguments));
      case Routes.createFood:
        return MaterialPageRoute(builder: (context) => CreateFoodView(meal: args as Meal?));
      default:
        return MaterialPageRoute(
          builder: (context) => GenericErrorView(
            buttonText: AppStrings.recipesTitle,
            onButtonPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.recipes.path,
              (_) => false,
            ),
          ),
        );
    }
  }
}
