import 'package:live_test/core/feature/comman/api_service/api_service.dart';
import 'package:live_test/core/feature/home/data/model/user_model.dart';

class UserRemoteDataSource {
  static Future<List<UserModel>?> getUserData(String path) async {
    final response = await ApiService.get(path);
    if (response.statusCode == 200) {
      final List res = response.data;
      return res.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
