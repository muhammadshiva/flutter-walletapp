// REQUEST FOR AUTHENTICATION
import 'package:http/http.dart' as http;
import 'package:moneywise_app/shared/shared_values.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/is-email-exist',
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
