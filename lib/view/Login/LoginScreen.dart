/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-01-13 15:10:31
 * @Descripttion: 登陆页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/widgets/GradientButton.dart';
import 'package:todo/routes/navigatorUtil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  handleLogin(context) {
    print('click Start');
    if (_formKey.currentState.validate()) {
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Color(0x00AAFF66), Color(0xA6D9F366)],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100.r),
                    width: 240.r,
                    height: 240.r,
                    decoration: BoxDecoration(
                        // color: Colors.red
                        ),
                    child: Text(
                      "TODO",
                      style: TextStyle(fontSize: 84.sp, height: 2.5),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(50.r, 0, 50.r, 0),
                          child: TextFormField(
                              controller: _username,
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
                              controller: _password,
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
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50.r, 50.r, 50.r, 20.r),
                    child: GradientButton(
                      context: context,
                      handelClick: () => {handleLogin(context)},
                      text: '登陆',
                      contextcolor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 36.sp,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20.r),
                      child: GestureDetector(
                        onTap: () => {
                          Histroy().push(context: context, path: '/register')
                        },
                        child: Text(
                          '还未注册，去注册',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
