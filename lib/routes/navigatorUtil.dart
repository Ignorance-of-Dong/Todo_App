/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 11:44:35
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-25 16:34:32
 * @Descripttion: 
 */
import './application.dart';
import './routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 对路由进一步封装
class Histroy {
  void ininState() {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  push({context, path, clearStack = false}) {
    ininState();
    return jump(context, path);
  }

  // 返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
    Application.router.pop(context);
  }

  pop(context) {
    Navigator.of(context).pop(context);
  }

  // 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 路由返回指定页面
  static void goBackUrl(BuildContext context, String title) {
    Navigator.popAndPushNamed(context, title);
  }

  // 路由跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.root,
        replace:
            true); // 如果有给路由赋值就用Routes.root  root是routes文件定义的字符串路径，没有直接用"/"等路由
  }

  // 跳转到转场动画页面
  static Future jump(BuildContext context, String title) {
    return Application.router
        .navigateTo(context, title, transition: TransitionType.inFromRight);
  }

  //  自定义转场动画
  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
          scale: animation,
          child: new RotationTransition(
            turns: animation,
            child: child,
          ));
    };
    return Application.router.navigateTo(context, title,
        transition: TransitionType.custom,
        //指定自定义动画
        transitionBuilder: transition,
        //自定义动画
        transitionDuration: const Duration(milliseconds: 600));
  }
}
