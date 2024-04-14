import 'package:flutter/material.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/viewmodels/users_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:users/src/domain/utils/resource.dart';
import 'package:users/src/views/widgets/users_list_item.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel viewModel = Provider.of<UsersViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body:
      StreamBuilder(
        stream: viewModel.getUsers(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(!snapshot.hasData) {
            return const Center(
              child: Text('No users found'),
            );
          }
          final response = snapshot.data;
          if(response is Failure) {
            final data = response as Failure;
            return Center(
              child: Text('Error ${data.error}'),
            );
          }
          final users = response as Success<List<User>>;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemBuilder: (context, index) => UsersListItem(users.data[index]),
              itemCount: users.data.length,
            ),
          );
        }),
      ),
    );
  }

}