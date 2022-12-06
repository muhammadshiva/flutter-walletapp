class MoneyPlanCategoriesModel {
  final int? id;
  final String? name;
  final String? thumbnail;

  MoneyPlanCategoriesModel({this.id, this.name, this.thumbnail});

  factory MoneyPlanCategoriesModel.fromJson(Map<String, dynamic> json) =>
      MoneyPlanCategoriesModel(
        id: json['id'],
        name: json['name'],
        thumbnail: json['thumbnail'],
      );
}
