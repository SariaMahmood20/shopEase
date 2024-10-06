import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/view_models/user_profile_view_model.dart';
// import 'package:shop_ease/app/resources/app_strings.dart';
// import 'package:shop_ease/app/navigation/route_name.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _userProfileViewModel =
        Provider.of<UserProfileViewModel>(context, listen: false);
    _userProfileViewModel.fetchUserProfileApi();
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider<UserProfileViewModel>(
      lazy: false,
      create: (context) => _userProfileViewModel,
      child: Drawer(
          child: ListView(
        children: [
          Consumer<UserProfileViewModel>(builder: (context, provider, child) {
            return UserAccountsDrawerHeader(
              accountName: Text(
                "${provider.userProfile.data!.data.firstName} ${provider.userProfile.data!.data.lastName}",
                style: styles.sfPro14w600,
              ),
              accountEmail: Text(
                provider.userProfile.data!.data.email,
                style: styles.sfPro12w400,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage(provider.userProfile.data!.data.avatar),
              ),
            );
          }),
          ListTile(
            title: const Text("Menu"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Categories"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Orders"),
            onTap: () {},
          )
        ],
      )),
    );
  }
}
