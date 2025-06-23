import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/authentication/view/signin_view.dart';
import 'package:store/features/authentication/view_model/cubit/auth_cubit.dart';
import 'package:store/features/order/view/my_orders_view.dart';
import 'package:store/features/profile/view/widgets/build_title_in_Profile_widget.dart';
import 'package:store/features/profile/view/widgets/name_in_profile_widget.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => SigninView()));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SigninView()),
              (rote) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(ScreenSize.width / 25),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameInProfileWidget(),
                  spaceVertical(height: ScreenSize.height / 30),
                  BuildTitleInProfileWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyOrdersView()));
                    },
                    title: "My Order",
                    leadingIcon: Icons.note_alt_outlined,
                  ),
                  spaceVertical(height: ScreenSize.height / 80),
                  BuildTitleInProfileWidget(
                    onTap: () {},
                    leadingIcon: Icons.settings_outlined,
                    title: "Settings",
                  ),
                  spaceVertical(height: ScreenSize.height / 80),
                  BuildTitleInProfileWidget(
                    onTap: () {},
                    leadingIcon: Icons.help_outline_outlined,
                    title: "Help Center",
                  ),
                  spaceVertical(height: ScreenSize.height / 80),
                  BuildTitleInProfileWidget(
                    onTap: () {},
                    leadingIcon: Icons.lock_clock_outlined,
                    title: "Privacy Policy",
                  ),
                  spaceVertical(height: ScreenSize.height / 80),
                  BuildTitleInProfileWidget(
                    onTap: () {},
                    leadingIcon: Icons.person_add_outlined,
                    title: "Invites Friends",
                  ),
                  spaceVertical(height: ScreenSize.height / 80),
                  BuildTitleInProfileWidget(
                    onTap: () {
                      customDialog(
                        dismissOnTouchOutside: true,
                        context: context,
                        stylishDialogType: StylishDialogType.INFO,
                        content: Text("Are you Sure you want to Log out ?"),
                        title: Text("Logout"),
                        cancelButton: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                        confirmButton: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor),
                          onPressed: () async {
                            await authCubit.logoutfromNativeProvider();
                            await authCubit.logoutFromGoogle();
                          },
                          child: Text(
                            "Yes, Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ).show();
                    },
                    leadingIcon: Icons.logout,
                    title: "Log out",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
