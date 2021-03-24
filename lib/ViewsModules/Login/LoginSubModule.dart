/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 11:52:05
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 18:14:00
 * @Descripttion: 登陆页UI模块
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Widgets/GradientButton.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';
import 'package:todo_app/Controller/Login/LoginController.dart';
import 'package:provider/provider.dart';

// 登录标题
Widget loginTitleWidget() {
  return Container(
    margin: EdgeInsets.only(top: 100.r),
    width: 240.r,
    height: 240.r,
    child: Text(
      'TODOa',
      style: TextStyle(fontSize: 84.sp, height: 2.5),
    ),
  );
}

Widget loginFormWidget(BuildContext context) {
  var username = context.watch<LoginController>().username;
  var formKey = context.watch<LoginController>().formKey;
  var password = context.watch<LoginController>().password;
  return Form(
    key: formKey,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(50.r, 0, 50.r, 0),
          child: TextFormField(
              controller: username,
              decoration: InputDecoration(hintText: '请输入账号'),
              validator: (value) {
                if (value.isEmpty) {
                  return '账户不能为空';
                }
                return null;
              }),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(50.r, 20.r, 50.r, 0),
          child: TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(hintText: '请输入密码'),
              validator: (value) {
                if (value.isEmpty) {
                  return '密码不能为空';
                }
                return null;
              }),
        ),
      ],
    ),
  );
}

// 登录按钮
Widget loginButtonWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
    child: GradientButton(
      context: context,
      handelClick: () => {context.read<LoginController>().handleLogin(context)},
      text: '登陆',
      contextcolor: Colors.black,
      textColor: Colors.white,
      fontSize: 36.sp,
    ),
  );
}

// 未注册按钮
Widget loginRegisterWidget(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(20.r),
      child: GestureDetector(
        onTap: () => {Histroy().push(context: context, path: '/register')},
        child: Text(
          '还未注册，去注册',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.blue),
        ),
      ));
}
