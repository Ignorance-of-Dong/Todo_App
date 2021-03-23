/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 14:40:55
 * @Descripttion: 登陆页面
 */
import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/Login/LoginSubModule.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return loginOrRegisterBuilderContainer(context, [
      loginTitleWidget(),
      loginFormWidget(context),
      loginButtonWidget(context),
      loginRegisterWidget(context)
    ]);
  }
}
