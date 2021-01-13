/*
 * @Author: zhangzheng
 * @Date: 2021-01-06 15:31:20
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-01-13 15:16:39
 * @Descripttion: 注册
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/widgets/GradientButton.dart';
import 'package:todo/routes/navigatorUtil.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _nickname = TextEditingController();

  handleRegister(context) {
    if (_formKey.currentState.validate()) {
      print(_username.text);
      Histroy().push(
        context: context,
        path: '/login',
      );
    } else {
      print('校验失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150.r),
            width: MediaQuery.of(context).size.width,
            child: Text("创建账户",
                style: TextStyle(fontSize: 55.sp), textAlign: TextAlign.center),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text("让我们马上给你开个账户吧!",
                style: TextStyle(fontSize: 30.sp, color: Colors.black45),
                textAlign: TextAlign.center),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
                    child: TextFormField(
                        controller: _nickname,
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
                          controller: _username,
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
                          controller: _password,
                          decoration: InputDecoration(hintText: '请输入密码'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return '密码不能为空';
                            }
                            return null;
                          })),
                ],
              )),
          Container(
            padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
            child: GradientButton(
              context: context,
              handelClick: () => {handleRegister(context)},
              text: '注册',
              contextcolor: Colors.black,
              textColor: Colors.white,
              fontSize: 36.sp,
            ),
          ),
        ],
      ),
    );
  }
}
