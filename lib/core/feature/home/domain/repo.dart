import 'package:live_test/core/feature/comman/utils/app_url.dart';
import 'package:live_test/core/feature/home/data/data_source/data_source.dart';
import 'package:live_test/core/feature/home/data/model/user_model.dart';

abstract class UserRepo {
  Future<List<UserModel>?> getUser() async =>
      UserRemoteDataSource.getUserData(AppUrl.fetchAllUers);
}
