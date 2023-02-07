import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

mixin AppConstant {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const primaryColor = Color.fromARGB(255, 246, 181, 84);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const subtitleColor = Color.fromARGB(255, 212, 212, 212);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const appBlack = Colors.black;
  static const appWhite = Colors.white;

  //SnackBar
  static void showSnackBar(
    BuildContext context,
    String text,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
        ),
        duration: const Duration(
          seconds: 1,
        ),
      ),
    );
  }

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  static const String authToken = "x-auth-token";
  static const String baseUrl = "http://192.168.0.102:3000/";
  static const String signUp = "api/signup";
  static const String signIn = "api/signin";
  static const String tokenValid = "tokenIsValid";

  static void httpErrorHandler({
    required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 400:
        showSnackBar(
          context,
          jsonDecode(response.body)['msg'],
        );
        break;
      case 500:
        showSnackBar(
          context,
          jsonDecode(response.body)['error'],
        );
        break;
      default:
        showSnackBar(
          context,
          response.body,
        );
    }
  }
}
