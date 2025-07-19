import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test/core/feature/home/data/model/user_model.dart';
import 'package:live_test/core/feature/home/domain/repo.dart';

import 'user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserRepo repository;

  UserNotifier(this.repository) : super(const UserState.initial());

  Future<void> loadUsers() async {
    state = const UserState.loading();
    try {
      final users = await repository.getUser();
      state = UserState.loaded(users ?? []);
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }

  Future<void> addUser(UserModel user) async {
    if (state is ) {
      final current = (state as _Loaded).users;
      // final newUser = await repository.addUser(user);
      state = UserState.loaded([...current, newUser]);
    }
  }

  Future<void> updateUser(UserModel user) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).users;
      // await repository.updateUser(user);
      final updated = current.map((u) => u.id == user.id ? user : u).toList();
      state = UserState.loaded(updated);
    }
  }

  Future<void> deleteUser(String id) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).users;
      // await repository.deleteUser(id);
      final updated = current.where((u) => u.id != id).toList();
      state = UserState.loaded(updated);
    }
  }
}
