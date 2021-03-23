/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 11:38:51
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:12:21
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

// 首页主体结构
Widget homeBuilderContainer(BuildContext context, List<Widget> childern) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: childern,
      ),
    ),
  );
}

// 登陆页主体结构
Widget loginOrRegisterBuilderContainer(
    BuildContext context, List<Widget> childern) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: childern,
      ),
    ),
  );
}

// 登录后页面主体
Widget initialBuilderContainer(BuildContext context, List<Widget> childern,
    Widget leading, Widget drawer) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      leading: leading,
      title: Text('Todo'),
      centerTitle: true,
      brightness: Brightness.dark,
    ),
    drawer: drawer,
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: childern,
      ),
    ),
  );
}

// 登录后页面主体
Widget myProfileBuilderContainer(
  BuildContext context,
  Widget leading,
  List<Widget> childern,
) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      leading: leading,
      title: Text('个人资料'),
      centerTitle: true,
      brightness: Brightness.dark,
    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: childern,
      ),
    ),
  );
}
