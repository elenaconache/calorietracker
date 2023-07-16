import 'package:calorietracker/models/collection/diary_entry_response.dart';
import 'package:calorietracker/ui/strings.dart';
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
        ))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      diaryEntryResponse.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (diaryEntryResponse.brand != null)
                      Text(
                        diaryEntryResponse.brand!,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w300),
                      )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    AppStrings.caloriesShortLabel(diaryEntryResponse.calories),
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
                  ))
            ])));
  }
}
