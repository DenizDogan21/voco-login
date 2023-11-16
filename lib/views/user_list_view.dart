//Bu sayfada kullanıcıların bir listesi mevcut, ayrıca giriş yapan kullanıcılar bu sayfaya yönlendirilir

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo/widgets/common.dart';
import 'package:demo/providers/user_list_provider.dart';

class UserListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    return Scaffold(
      appBar: appBar(context, "Kullanıcı Listesi"), // widgets/common.dart'dan çağırılan method
      body: Stack(children: [
        background(context),  // widgets/common.dart'dan çağırılan method
        ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),]),
    );
  }
}
