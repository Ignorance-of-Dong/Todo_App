/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 11:09:57
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-12-30 16:58:44
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'view/Home/HomeScreen.dart';
import 'routes/navigatorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Histroy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        child: MaterialApp(
            debugShowCheckedModeBanner: false, // 取消右上角debug标志
            title: 'Todo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomeScreen()));
  }
}
