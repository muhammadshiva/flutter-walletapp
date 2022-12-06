class MoneyPlanFormModel {
  final String? categoryId;
  final String? amount;
  final String? name;

  MoneyPlanFormModel({
    this.categoryId,
    this.amount,
    this.name,
  });

  MoneyPlanFormModel copyWith({
    String? categoryId,
    String? amount,
    String? name,
  }) =>
      MoneyPlanFormModel(
        categoryId: categoryId ?? this.categoryId,
        amount: amount ?? this.amount,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'amount': amount,
        'name': name,
      };
}
