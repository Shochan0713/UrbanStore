import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanstore/view/order_management/OrderHistoryDisplayScreen.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/view/user_management/LoginScreen.dart';
import 'package:urbanstore/view/user_management/UserInfoRegistration.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/custom_card_button.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';
import 'package:urbanstore/viewmodel/user_view_model.dart';

class Userinfo extends StatelessWidget {
  const Userinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<UserViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  Center(
                    child: viewModel.user != null
                        ? Text(
                            'メールアドレス: ${viewModel.user!.email}',
                            style: const TextStyle(fontSize: 16.0),
                          )
                        : const Text(
                            'メールアドレスなし',
                            style: TextStyle(fontSize: 16.0),
                          ),
                  ),
                  const SizedBox(height: 16),
                  viewModel.userInfo != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('名前: ${viewModel.userInfo!.name}',
                                style: const TextStyle(fontSize: 16.0)),
                            Text(
                                '住所: ${viewModel.userInfo!.address?.street}, ${viewModel.userInfo!.address?.city}, ${viewModel.userInfo!.address?.state}, ${viewModel.userInfo!.address?.postalCode}, ${viewModel.userInfo!.address?.country}',
                                style: const TextStyle(fontSize: 16.0)),
                            Text('電話番号: ${viewModel.userInfo!.phoneNumber}',
                                style: const TextStyle(fontSize: 16.0)),
                          ],
                        )
                      : const Text('未登録です。'),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomCardButton(
                              label: 'ユーザー情報登録画面へ',
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Userinforegistrationscreen(),
                                  ),
                                );
                              },
                            ),
                            CustomCardButton(
                              label: 'Home画面へ',
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomCardButton(
                              label: '購入履歴',
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderHistoryDisplayScreen(),
                                  ),
                                );
                              },
                            ),
                            CustomCardButton(
                              label: 'ログアウト',
                              onTap: () async {
                                await viewModel.signOut();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
