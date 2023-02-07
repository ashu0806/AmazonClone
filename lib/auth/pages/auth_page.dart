import 'package:amazon_clone/auth/services/auth_services.dart';
import 'package:amazon_clone/core/utils/app_constant.dart';
import 'package:amazon_clone/core/widgets/custom_button.dart';
import 'package:amazon_clone/core/widgets/user_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AuthType {
  signin,
  signup,
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String routeName = '/authPage';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthType auth = AuthType.signup;
  final authServices = AuthServices();
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() {
    authServices.signUpUser(
      context: context,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void signInUser() {
    authServices.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.backgroundColor,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    title: Text(
                      "Create account",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 16.sp,
                            color: AppConstant.appBlack,
                          ),
                    ),
                    leading: Radio<AuthType>(
                      activeColor: AppConstant.secondaryColor,
                      value: AuthType.signup,
                      groupValue: auth,
                      onChanged: (value) {
                        setState(() {
                          auth = value!;
                        });
                      },
                    ),
                  ),
                  if (auth == AuthType.signup)
                    Form(
                      key: signUpFormKey,
                      child: Column(
                        children: [
                          UserInputField(
                            controller: nameController,
                            hintText: 'Name',
                          ),
                          UserInputField(
                            controller: emailController,
                            hintText: 'Email',
                          ),
                          UserInputField(
                            controller: passwordController,
                            hintText: 'Password',
                          ),
                          CustomButton(
                            text: "Sign Up",
                            color: AppConstant.secondaryColor,
                            onTap: () {
                              if (signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListTile(
                    title: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 16.sp,
                            color: AppConstant.appBlack,
                          ),
                    ),
                    leading: Radio<AuthType>(
                      activeColor: AppConstant.secondaryColor,
                      value: AuthType.signin,
                      groupValue: auth,
                      onChanged: (value) {
                        setState(() {
                          auth = value!;
                        });
                      },
                    ),
                  ),
                  if (auth == AuthType.signin)
                    Form(
                      key: signInFormKey,
                      child: Column(
                        children: [
                          UserInputField(
                            controller: emailController,
                            hintText: 'Email',
                          ),
                          UserInputField(
                            controller: passwordController,
                            hintText: 'Password',
                          ),
                          CustomButton(
                            text: "Sign In",
                            color: AppConstant.secondaryColor,
                            onTap: () {
                              if (signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
