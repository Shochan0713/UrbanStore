import 'package:flutter/material.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';
import 'package:urbanstore/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart'; // Provider パッケージを利用

class Userinforegistrationscreen extends StatelessWidget {
  const Userinforegistrationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: null),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserViewModel>(
          builder: (context, viewModel, child) {
            return ListView(
              children: [
                TextField(
                  controller: viewModel.nameController,
                  decoration: const InputDecoration(labelText: '名前'),
                ),
                TextField(
                  controller: viewModel.streetController,
                  decoration: const InputDecoration(labelText: '住所（街）'),
                ),
                TextField(
                  controller: viewModel.cityController,
                  decoration: const InputDecoration(labelText: '住所（市）'),
                ),
                TextField(
                  controller: viewModel.stateController,
                  decoration: const InputDecoration(labelText: '住所（州）'),
                ),
                TextField(
                  controller: viewModel.postalCodeController,
                  decoration: const InputDecoration(labelText: '郵便番号'),
                ),
                TextField(
                  controller: viewModel.countryController,
                  decoration: const InputDecoration(labelText: '国'),
                ),
                TextField(
                  controller: viewModel.phoneNumberController,
                  decoration: const InputDecoration(labelText: '電話番号'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => viewModel.saveUserInfo(context),
                  child: const Text('保存'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
