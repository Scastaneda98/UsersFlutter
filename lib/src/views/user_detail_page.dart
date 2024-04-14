import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/domain/utils/resource.dart';
import 'package:users/src/viewmodels/users_viewmodel.dart';
import 'package:users/src/views/widgets/header_card.dart';
import 'package:users/src/views/widgets/information_card.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  UserDetailPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    UsersViewModel viewModel = Provider.of<UsersViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
      ),
      body: StreamBuilder(
        stream: viewModel.getUserById(userId),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(!snapshot.hasData) {
            return const Center(
              child: Text('No user found'),
            );
          }
          final response = snapshot.data;
          if(response is Failure) {
            final data = response as Failure;
            return Center(
              child: Text('Error ${data.error}'),
            );
          }
          final user = response as Success<User>;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                HeaderCard(user.data.name, user.data.username),
                InformationCard("Contact information",[user.data.email,user.data.phone,user.data.website], 150),
                InformationCard("Company",[user.data.company.name,user.data.company.catchPhrase,user.data.company.bs], 150),
                InformationCard("Company",[user.data.address.city,user.data.address.street, user.data.address.suite, user.data.address.zipcode, user.data.address.geo.lat, user.data.address.geo.lng], 200)
              ],
            ),
          );
        }),
      ),
    );
  }
}

