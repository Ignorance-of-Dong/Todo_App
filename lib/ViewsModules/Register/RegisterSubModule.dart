/*
 * @Author: zhangzheng
 * @Date: 2021-03-23 14:31:54
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 15:04:55
 * @Descripttion: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Controller/Register/RegisterController.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/GradientButton.dart';

// 注册页标题
Widget registerTitleWidget(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 150.r),
          width: MediaQuery.of(context).size.width,
          child: Text('创建账户',
              style: TextStyle(fontSize: 55.sp), textAlign: TextAlign.center),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text('让我们马上给你开个账户吧!',
              style: TextStyle(fontSize: 30.sp, color: Colors.black45),
              textAlign: TextAlign.center),
        ),
      ],
    ),
  );
}

// 注册表单容器
Widget registerFormWidget(BuildContext context) {
  var nickname = context.watch<RegisterController>().username;
  var username = context.watch<RegisterController>().username;
  var formKey = context.watch<RegisterController>().formKey;
  var password = context.watch<RegisterController>().password;
  return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
            child: TextFormField(
                controller: nickname,
                decoration: InputDecoration(hintText: '请输入昵称'),
                validator: (value) {
                  if (value.isEmpty) {
                    return '昵称不能为空';
                  }
                  return null;
                }),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(50.r, 10.r, 50.r, 20.r),
              child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(hintText: '请输入账号'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '账号不能为空';
                    }
                    return null;
                  })),
          Container(
              padding: EdgeInsets.fromLTRB(50.r, 10.r, 50.r, 20.r),
              child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(hintText: '请输入密码'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '密码不能为空';
                    }
                    return null;
                  })),
        ],
      ));
}

// 注册点击事件
Widget registerButtonWidget(BuildContext context) {
  var handleRegister = context.read<RegisterController>().handleRegister;
  return Container(
    padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
    child: GradientButton(
      context: context,
      handelClick: () => {handleRegister(context)},
      text: '注册',
      contextcolor: Colors.black,
      textColor: Colors.white,
      fontSize: 36.sp,
    ),
  );
}
