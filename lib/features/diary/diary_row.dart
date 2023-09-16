import 'package:calorietracker/extensions/numeric_extensions.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DiaryRow extends StatelessWidget {
  final DiaryEntry diaryEntry;

  const DiaryRow({super.key, required this.diaryEntry});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 0.4,
                color: Theme.of(context).dividerColor,
              ),
            )),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          diaryEntry.food.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            if (diaryEntry.food.brandName != null)
                              Text(
                                '${diaryEntry.food.brandName!}, ',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w300),
                              ),
                            Text(
                              AppStrings.gramsValue(diaryEntry.servingQuantity.toDouble().toPrecision(2)),
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
                ]))));
  }

  String get _diaryEntryCalories => AppStrings.caloriesShortLabel(
      Nutrition.perServing(nutritionPer100Grams: diaryEntry.food.nutrition, servingSizeGrams: diaryEntry.servingQuantity.toDouble())
          .calories
          .toInt());
}
