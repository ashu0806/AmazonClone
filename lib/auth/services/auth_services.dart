// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/auth/models/user_model.dart';
import 'package:amazon_clone/auth/shared/user_provider.dart';
import 'package:amazon_clone/core/utils/app_constant.dart';
import 'package:amazon_clone/home/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = UserModel(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      final response = await http.post(
        Uri.parse(
          AppConstant.baseUrl + AppConstant.signUp,
        ),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      AppConstant.httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {
          AppConstant.showSnackBar(
            context,
            "Account Created! Log In with same credential",
          );
        },
      );
    } catch (e) {
      AppConstant.showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          AppConstant.baseUrl + AppConstant.signIn,
        ),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log(response.body);
      AppConstant.httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () async {
          var prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(
            response.body,
          );
          await prefs.setString(
            AppConstant.authToken,
            jsonDecode(response.body)['token'],
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      AppConstant.showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void getuserData(
    BuildContext context,
  ) async {
    try {
      var prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString(
        AppConstant.authToken,
      );

      if (token == null) {
        prefs.setString(
          AppConstant.authToken,
          '',
        );
      }
      final tokenResponse = await http.post(
        Uri.parse(
          AppConstant.baseUrl + AppConstant.tokenValid,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      final response = jsonDecode(tokenResponse.body);

      if (response == true) {
        final userResponse = await http.get(
          Uri.parse(
            AppConstant.baseUrl,
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }
}
