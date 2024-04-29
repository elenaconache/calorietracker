class MacroGoals {
  final int calories;
  final int roundedCarbsPercentage;
  final int roundedProteinPercentage;
  final int roundedFatPercentage;
  final int roundedCarbsGrams;
  final int roundedProteinGrams;
  final int roundedFatGrams;

  const MacroGoals({
    required this.calories,
    required this.roundedCarbsGrams,
    required this.roundedProteinGrams,
    required this.roundedFatGrams,
    required this.roundedCarbsPercentage,
    required this.roundedProteinPercentage,
    required this.roundedFatPercentage,
  });

  MacroGoals copyWith({
    int? calories,
    int? roundedCarbsGrams,
    int? roundedProteinGrams,
    int? roundedFatGrams,
    int? roundedCarbsPercentage,
    int? roundedProteinPercentage,
    int? roundedFatPercentage,
  }) =>
      MacroGoals(
        calories: calories ?? this.calories,
        roundedCarbsGrams: roundedCarbsGrams ?? this.roundedCarbsGrams,
        roundedCarbsPercentage: roundedCarbsPercentage ?? this.roundedCarbsPercentage,
        roundedProteinGrams: roundedProteinGrams ?? this.roundedProteinGrams,
        roundedProteinPercentage: roundedProteinPercentage ?? this.roundedProteinPercentage,
        roundedFatGrams: roundedFatGrams ?? this.roundedFatGrams,
        roundedFatPercentage: roundedFatPercentage ?? this.roundedFatPercentage,
      );
}
