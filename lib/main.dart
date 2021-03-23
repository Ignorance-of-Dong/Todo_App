/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 11:09:57
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:17:52
 * @Descripttion: main
 */
import 'package:flutter/material.dart';
import 'view/Home/HomeScreen.dart';
import 'Routes/navigatorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/Login/LoginController.dart';
import 'package:todo_app/Controller/Register/RegisterController.dart';
import 'package:todo_app/Controller/MyProfile/MyProfileController.dart';

void main() {
  Histroy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => RegisterController()),
      ChangeNotifierProvider(create: (_) => MyProfileController())
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
            home: HomeScreen()));
  }
}
