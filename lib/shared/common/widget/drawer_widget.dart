import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/service_locator.dart';
import 'package:template/features/auth/presentation/view/login_screen.dart';
import 'package:template/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:template/features/home/presentation/view/home_screen.dart';
import 'package:template/features/travel/presentation/pages/travel_screen.dart';

import '../../../app/singlton.dart';
import 'change_theme_widget.dart';
import 'component.dart';
import 'custom_image_widget.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/manager_values.dart';
import '../../resources/size_config.dart';
import '../../resources/styles_manager.dart';
import '../../../features/auth/presentation/view/account_screen.dart';

import '../../../features/tips/presentation/pages/tip_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDrawerView(context);
  }

  Widget buildDrawerView(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Padding(
        padding:
            getPadding(vertical: AppPadding.p24, horizontal: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: AppPadding.p32,
            ),
            InkWell(
              splashColor: ColorManager.white,
              onTap: () {
                changeNavigator(context, const AccountScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s50,
                    width: AppSize.s50,
                    child: CircleAvatar(
                        backgroundColor: ColorManager.gray16,
                        radius: AppSize.s40,
                        child: CustomSvgImage(
                          height: AppSize.s28,
                          imageName: Assets.assetsSvgPerson,
                          color: ColorManager.coolGray,
                        )),
                  ),
                  const SizedBox(
                    width: AppPadding.p8,
                  ),
                  BlocProvider<AuthCubit>(
                    create: (context) {
                      return AuthCubit()..getUser();
                    },
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Singleton().userData?['fullName'] ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: AppPadding.p4,
                            ),
                            Text(
                              Singleton().userData?['email'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: FontSize.s14),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppPadding.p16),
            const Divider(),
            buildDrawerItem(
              svgName: Assets.assetsSvgComplete,
              name: "Dashboard",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // buildDrawerItem(
            //     svgName: Assets.assetsSvgContactUs,
            //     name: "Contact us",
            //     onTap: () {
            //       changeNavigator(
            //           context,
            //           Singleton().userData?['isSupporter'] ?? false
            //               ? const MessagesScreen()
            //               : const ChatRoomScreen());
            //     }),
            buildDrawerItem(
              svgName: Assets.assetsSvgCategory,
              name: "Travels",
              onTap: () {
                changeNavigator(context, const TravelScreen());
              },
            ),
            buildDrawerItem(
              svgName: Assets.assetsSvgBranchIcon,
              name: "Tips",
              onTap: () {
                initTipsModule();
                changeNavigator(context, ProviderScope(child: TipPage()));
              },
            ),
            buildDrawerItem(
              svgName: Assets.assetsSvgCategory,
              name: "Recipes",
              onTap: () {
                changeNavigator(context, const HomeScreen());
              },
            ),
            const ChangeThemeWidget(),
            BlocProvider<AuthCubit>(
              create: (context) {
                return AuthCubit();
              },
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (ctx, state) {
                  if (state is AuthLogoutSuccessState) {
                    changeNavigatorAndRemoveUntil(context, const LoginScreen());
                  }
                },
                builder: (ctx, state) => buildDrawerItem(
                    svgName: Assets.assetsSvgLogout,
                    name: "Log out",
                    onTap: () {
                      final logout = ctx.read<AuthCubit>();
                      logout.logout();
                    }),
              ),
            ),
            const SizedBox(height: AppPadding.p16),
          ],
        ),
      )),
    );
  }

  Widget buildDrawerItem({
    required String name,
    required String svgName,
    required Function onTap,
  }) {
    return ListTile(
      splashColor: ColorManager.white,
      // contentPadding: getPadding(horizontal: 5),
      minLeadingWidth: 17,
      leading: CustomSvgImage(
        width: 17,
        imageName: svgName,
        color: ColorManager.coolGray,
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: FontSize.s14),
      ),
      onTap: onTap as VoidCallback,
    );
  }
}
