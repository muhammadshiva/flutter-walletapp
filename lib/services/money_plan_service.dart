// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:moneywise_app/models/money_plan_model.dart';
// import 'package:moneywise_app/services/auth_service.dart';
// import 'package:moneywise_app/shared/shared_values.dart';
// import 'package:http/http.dart' as http;

// import '../models/money_plan_categories_model.dart';

// class MoneyPlanService {
//   //   // FETCH MONEY PLAN CATEGORIES
//   Future<List<MoneyPlanCategoriesModel>> getMoneyPlanCategories() async {
//     try {
//       final token = await AuthService().getToken();

//       final res = await http.get(
//         Uri.parse(
//           '$baseUrl/moneyplan-categories',
//         ),
//         headers: {
//           'Authorization': token,
//         },
//       );

//       if (res.statusCode == 200) {
//         return List<MoneyPlanCategoriesModel>.from(
//           jsonDecode(res.body)['data'].map(
//             (moneyPlanCategories) =>
//                 MoneyPlanCategoriesModel.fromJson(moneyPlanCategories),
//           ),
//         ).toList();
//       }

//       debugPrint('PLAN CATEGORIES : ${res.body}');
//       throw jsonDecode(res.body)['message'];
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<List<MoneyPlanModel>> getMoneyPlans() async {
//     try {
//       final token = await AuthService().getToken();

//       final res = await http.get(
//         Uri.parse(
//           '$baseUrl/money_plans',
//         ),
//         headers: {
//           'Authorization': token,
//         },
//       );

//       if (res.statusCode == 200) {
//         return List<MoneyPlanModel>.from(
//           jsonDecode(res.body)['data'].map(
//             (moneyplan) => MoneyPlanModel.fromJson(moneyplan),
//           ),
//         ).toList();
//       }

//       throw jsonDecode(res.body)['message'];
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//import 'package:moneywise_app/api/api_dio.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/models/money_plan_form_model.dart';
import 'package:moneywise_app/models/money_plan_model.dart';
import 'package:moneywise_app/services/auth_service.dart';
import 'package:moneywise_app/shared/shared_values.dart';

class MoneyPlanService {
  //final ApiDio _provider = ApiDio();

  // FETCH MONEY PLAN CATEGORIES
  Future<List<MoneyPlanCategoriesModel>> getMoneyPlanCategories() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/moneyplan-categories',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<MoneyPlanCategoriesModel>.from(
          jsonDecode(res.body)['data'].map(
            (moneyPlanCategories) =>
                MoneyPlanCategoriesModel.fromJson(moneyPlanCategories),
          ),
        ).toList();
      }

      debugPrint('PLAN CATEGORIES : ${res.body}');
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  // FETCH MONEY PLANS

  Future<List<MoneyPlanModel>> getMoneyPlans() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
          Uri.parse(
            '$baseUrl/money_plans',
          ),
          headers: {
            'Authorization': token,
          });

      // return MoneyPlanResponse.fromJson(res);

      if (res.statusCode == 200) {
        return List<MoneyPlanModel>.from(
          jsonDecode(res.body)['data'].map(
            (moneyplans) => MoneyPlanModel.fromJson(moneyplans),
          ),
        );
      }

      debugPrint('MONEY PLANS : ${res.body}');
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  // CREATE MONEY PLANS
  Future<void> createMoneyPlan(MoneyPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/money_plans',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      debugPrint('CREATE MONEY PLAN : ${res.body}');

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  // Future<void> createMoneyPlan({
  //   required int categoryId,
  //   required int amount,
  //   required String name,
  // }) async {
  //   final token = await AuthService().getToken();
  //   Map<String, dynamic> data = {
  //     "category_id": categoryId,
  //     "amount": amount,
  //     "name": name,
  //   };

  //   var response = await http.post(
  //     Uri.parse(
  //       '$baseUrl/money_plans',
  //     ),
  //     headers: {
  //       'Authorization': token,
  //     },
  //     body: data,
  //   );

  //   debugPrint('CREATE MONEY PLANS : $response');
  // }

  // UPDATE MONEY PLANS
  Future<void> updateMoneyPlan({
    int? id,
    required String name,
    required int amount,
  }) async {
    final token = await AuthService().getToken();
    Map<String, dynamic> data = {
      "name": name,
      "amount": amount,
    };

    var response = await http.put(
      Uri.parse('$baseUrl/money_plans/$id'),
      headers: {
        'Authorization': token,
      },
      body: data,
    );

    debugPrint('UPDATE MONEY PLANS : $response');
  }

  // DELETE MONEY PLANS
  Future<void> deleteMoneyPlan({required int id}) async {
    final token = await AuthService().getToken();
    var response = await http.delete(
      Uri.parse('$baseUrl/money_plans/delete/$id'),
      headers: {
        'Authorization': token,
      },
    );

    debugPrint('DELETE MONEY PLAN : $response');
  }
}
