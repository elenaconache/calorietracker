import 'package:calorietracker/models/collection/diary_entry_response.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DiaryEntry extends StatelessWidget {
  final DiaryEntryResponse diaryEntryResponse;

  const DiaryEntry({super.key, required this.diaryEntryResponse});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            width: 0.1,
            color: Theme.of(context).dividerColor,
          ),
        )),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      diaryEntryResponse.food.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        if (diaryEntryResponse.food.brand != null)
                          Text(
                            '${diaryEntryResponse.food.brand!}, ',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w300),
                          ),
                        Text(
                          AppStrings.gramsValue(diaryEntryResponse.servingQuantity.toInt()),
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    _diaryEntryCalories,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
                  ))
            ])));
  }

  String get _diaryEntryCalories => AppStrings.caloriesShortLabel(Nutrition.perServing(
          nutritionPer100Grams: diaryEntryResponse.food.nutritionInfo, servingSizeGrams: diaryEntryResponse.servingQuantity.toDouble())
      .calories
      .toInt());
}
