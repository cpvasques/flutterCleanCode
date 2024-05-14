import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String apiUrl = '';

  static void setEnvironment() {
    apiUrl = dotenv.env['API_BASE_URL']!;
  }
}
