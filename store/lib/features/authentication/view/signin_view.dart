import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/core/widgets/custom_materialbutton.dart';
import 'package:store/core/widgets/normal_text_formfield.dart';
import 'package:store/core/widgets/secret_text_formfield.dart';
import 'package:store/features/authentication/view/authfunctions/auth_functions.dart';
import 'package:store/features/authentication/view/widgets/donot_have_acc_widget.dart';
import 'package:store/features/authentication/view/widgets/forget_password_widget.dart';
import 'package:store/features/authentication/view/widgets/signin_head_line_widget.dart';
import 'package:store/features/authentication/view/widgets/signin_with_google_button_widget.dart';
import 'package:store/features/authentication/view_model/cubit/auth_cubit.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        signInListenerState(state, context, authCubit);
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading ||
              state is SignInLoading ||
              State is SigninWithGoogleLoading,
          progressIndicator: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          child: Scaffold(
            backgroundColor: kbackcolor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(ScreenSize.width / 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      spaceVertical(height: ScreenSize.height / 10),
                      SignInHeadLineWidget(),
                      spaceVertical(height: ScreenSize.height / 40),
                      NormalTextFormfield(
                        type: TextInputType.emailAddress,
                        controller: authCubit.emailIn,
                        hint: "Enter Your Email",
                        label: "Email Address",
                      ),
                      SecretTextFormfield(
                        type: TextInputType.text,
                        label: "password",
                        hint: "Enter Your Password",
                        controller: authCubit.passwordIn,
                      ),
                      spaceVertical(height: ScreenSize.height / 500),
                      ForgetPasswordWidget(authCubit: authCubit),
                      spaceVertical(height: ScreenSize.height / 20),
                      CustomMaterialButton(
                        text: "Sign in",
                        onPress: () async {
                          if (formKey.currentState!.validate()) {
                            authCubit.signIn();
                          }
                        },
                      ),
                      spaceVertical(height: ScreenSize.height / 40),
                      SigninWithGoogleButtonWidget(onPress: () {
                        authCubit.signInWithGoogle();
                      }),
                      spaceVertical(height: ScreenSize.height / 20),
                      DonotHaveAccWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
