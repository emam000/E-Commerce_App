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
import 'package:store/features/authentication/view/widgets/already_have_acc_widget.dart';
import 'package:store/features/authentication/view/widgets/signup_head_line_widget.dart';
import 'package:store/features/authentication/view_model/cubit/auth_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        signUpListenerState(state, context, authCubit);
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
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
                      spaceVertical(height: ScreenSize.height / 10), //20
                      SignUpHeadLineWidget(),
                      spaceVertical(height: ScreenSize.height / 40),
                      // CustomPickImage(
                      //   image: authCubit.profileImage == null
                      //       ? AssetImage("assets/images/profilephoto.webp")
                      //       : FileImage(
                      //           authCubit.profileImage!,
                      //         ),
                      //   onPress: () {
                      //     authCubit.pickImage();
                      //   },
                      // ),
                      NormalTextFormfield(
                        type: TextInputType.name,
                        controller: authCubit.nameUp,
                        hint: "Enter Your Name",
                        label: "User Name",
                      ),
                      NormalTextFormfield(
                        type: TextInputType.phone,
                        controller: authCubit.phoneUp,
                        hint: "Enter Your Phone Number",
                        label: "Phone Number",
                      ),
                      NormalTextFormfield(
                        type: TextInputType.emailAddress,
                        controller: authCubit.emailUp,
                        hint: "Enter Your Email",
                        label: "Email Address",
                      ),
                      SecretTextFormfield(
                        type: TextInputType.text,
                        label: "password",
                        hint: "Enter Your Password",
                        controller: authCubit.passwordUp,
                      ),
                      spaceVertical(height: ScreenSize.height / 20),
                      CustomMaterialButton(
                        text: "Register",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.signUp();
                          }
                        },
                      ),
                      spaceVertical(height: ScreenSize.height / 50),
                      AlreadyHaveAccWidget(),
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
