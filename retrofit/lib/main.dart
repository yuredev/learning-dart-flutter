import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_test/models/user_model.dart';
import 'package:retrofit_test/services/user_service.dart';

main() => runApp(MaterialApp(
  routes: {
    '/': (ctx) => HomeScreen(),
  },
));


class HomeScreen extends StatelessWidget {
  final _userService = UserService(Dio());
  late final List<UserModel> _users;

  Future<void> loadUsers() async {
    _users = await _userService.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RetroFitTest'),
      ),
      body: FutureBuilder(
        future: loadUsers(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('An error has ocurred'),
            );
          }
          return ListView.builder(
            itemCount: _users.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text(_users[index].name),
            ),
          );
        },
      ),
    );
  }
}
