/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 11:09:57
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 14:49:39
 * @Descripttion: main
 */
import 'package:flutter/material.dart';
import 'view/Initial/InitialScreen.dart';
import 'Routes/navigatorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/Login/LoginController.dart';
import 'package:todo_app/Controller/Register/RegisterController.dart';
import 'package:todo_app/Controller/MyProfile/MyProfileController.dart';
import 'package:todo_app/Controller/Home/HomeController.dart';
import 'package:todo_app/Controller/RecipesList/RecipesListController.dart';
import 'package:todo_app/Controller/RecipesDetail/RecipesDetailController.dart';
import 'package:todo_app/Controller/RecipesSearch/RecipesSearchController.dart';

void main() {
  Histroy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => RegisterController()),
      ChangeNotifierProvider(create: (_) => MyProfileController()),
      ChangeNotifierProvider(create: (_) => HomeController()),
      ChangeNotifierProvider(create: (_) => RecipesListController()),
      ChangeNotifierProvider(create: (_) => RecipesDetailController()),
      ChangeNotifierProvider(create: (_) => RecipesSearchController())
    ],
    child: MyApp(),
  ));
}

const PrimaryColor = const Color(0xFF151026);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false, // 取消右上角debug标志
            title: 'Todo',
            theme: ThemeData(
              primaryColor: PrimaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: InitialScreen()));
  }
}
