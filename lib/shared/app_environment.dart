import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

const collectionApiBaseUrlKey = 'COLLECTION_API_BASE_URL';
const nutritionixApiBaseUrlKey = 'NUTRITIONIX_API_BASE_URL';
const nutritionixAppIdKey = 'NUTRITIONIX_APP_ID';
const nutritionixAppKey = 'NUTRITIONIX_APP_KEY';
const userApiBaseUrlKey = 'USER_API_BASE_URL';

@injectable
class AppEnvironment {
  @factoryMethod
  static Future<AppEnvironment> create() async {
    await dotenv.load(fileName: 'assets/.env');
    return AppEnvironment();
  }

  String getString({required String key}) => dotenv.get(key);
}
