import 'package:amazon_clone/auth/pages/auth_page.dart';
import 'package:amazon_clone/auth/services/auth_services.dart';
import 'package:amazon_clone/auth/shared/user_provider.dart';
import 'package:amazon_clone/core/routes/app_routes.dart';
import 'package:amazon_clone/core/utils/app_theme.dart';
import 'package:amazon_clone/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authServices = AuthServices();

  @override
  void initState() {
    authServices.getuserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Amazon Clone',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => generateRoute(settings),
          theme: AppTheme.light,
          home: child,
        );
      },
      child: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomePage()
          : const AuthPage(),
    );
  }
}
