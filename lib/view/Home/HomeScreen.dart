/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-01-06 15:32:34
 * @Descripttion: s首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todo/routes/navigatorUtil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> currentTime = ValueNotifier<String>("1");
  @override
  void initState() {
    const period = const Duration(seconds: 1);
    Timer.periodic(period, (timer) {
      currentTime.value = formatDate(DateTime.now(), [HH, ':', nn, ':', ss]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Color(0x00AAFF66), Color(0xA6D9F366)],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter)),
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: currentTime,
                builder: (BuildContext context, String value, Widget child) {
                  return Container(
                      margin: EdgeInsets.only(top: 100.r),
                      child: Text(value,
                          style: TextStyle(fontSize: 84.sp, height: 2.5)));
                }),
            Container(
              margin: EdgeInsets.only(top: 50.r),
              child: Text('Hi Partner'),
            ),
            Container(
                height: 100.h,
                padding: EdgeInsets.fromLTRB(40.r, 20.r, 40.r, 0),
                child: TyperAnimatedTextKit(
                  pause: Duration(milliseconds: 1500),
                  text: ['人生没有什么捷径，唯一出路就是跟困难死磕。如果问题还没解决，那就不要轻易说放弃。'],
                  textStyle: TextStyle(fontSize: 30.sp, fontFamily: "Bobbers"),
                  textAlign: TextAlign.center,
                )),
            Container(
              height: 600.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () =>
                            {Histroy().push(context: context, path: "/login")},
                        child: Icon(Icons.keyboard_tab,
                            size: 50, textDirection: TextDirection.ltr),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
