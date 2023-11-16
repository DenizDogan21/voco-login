// uygulamanın kullanıcı listesini bir API'dan alarak yönetmesini ve bu listeyi
// uygulamanın farklı kısımlarında kolayca kullanılabilir hale getirmesini sağlar

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final userListProvider = StateNotifierProvider<UserListNotifier, List<User>>((ref) {
  return UserListNotifier();
});

class UserListNotifier extends StateNotifier<List<User>> {
  UserListNotifier() : super([]) {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users'));
    if (response.statusCode == 200) {
      List<dynamic> usersJson = jsonDecode(response.body)['data'];
      state = usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      // Hata işleme
    }
  }
}
