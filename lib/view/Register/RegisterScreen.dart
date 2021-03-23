/*
 * @Author: zhangzheng
 * @Date: 2021-01-06 15:31:20
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 14:42:12
 * @Descripttion: 注册
 */

import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/Register/RegisterSubModule.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return loginOrRegisterBuilderContainer(context, [
      registerTitleWidget(context),
      registerFormWidget(context),
      registerButtonWidget(context)
    ]);
  }
}
