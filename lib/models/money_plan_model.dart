import 'package:moneywise_app/models/money_plan_categories_model.dart';

class MoneyPlanModel {
  MoneyPlanModel({
    this.id,
    this.name,
    this.thumbnail,
    this.amount,
  });

  final int? id;
  final String? name;
  final String? thumbnail;
  final int? amount;

  factory MoneyPlanModel.fromJson(Map<String, dynamic> json) => MoneyPlanModel(
        id: json['id'],
        name: json['name'],
        thumbnail: json['thumbnail'],
        // thumbnail: json['thumbnail'] == null
        //     ? null
        //     : MoneyPlanCategoriesModel.fromJson(json['thumbnail']),
        amount: json['amount'],
      );
}



// class MoneyPlanResponse {
//   MoneyPlanResponse({
//     required this.data,
//     this.message,
//   });

//   List<MoneyPlanModel> data;
//   String? message;

//   factory MoneyPlanResponse.fromJson(Map<String, dynamic> json) =>
//       MoneyPlanResponse(
//         data: List<MoneyPlanModel>.from(
//             json["data"].map((x) => MoneyPlanModel.fromJson(x))),
//         message: json["message"],
//       );
// }