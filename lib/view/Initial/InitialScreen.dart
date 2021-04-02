/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 16:24:35
 * @Descripttion: 初始页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final ValueNotifier<String> currentTime =
      ValueNotifier<String>(formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));
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
        child: Flex(
          direction: Axis.vertical,
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
            Expanded(
              flex: 1,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                      bottom: 300.r,
                      child: GestureDetector(
                        onTap: () =>
                            {Histroy().push(context: context, path: '/login')},
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
