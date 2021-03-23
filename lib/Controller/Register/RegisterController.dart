/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:17:35
 * @Descripttion: 注册事件操作方法
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class RegisterController with ChangeNotifier {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _nickname = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get username => _username;
  TextEditingController get password => _password;
  TextEditingController get nickname => _nickname;
  GlobalKey<FormState> get formKey => _formKey;

  // 注册点击事件
  handleRegister(BuildContext context) {
    print("111");
    if (_formKey.currentState.validate()) {
      Histroy().push(
        context: context,
        path: '/initial',
      );
    } else {
      print('校验失败');
      notifyListeners();
    }
  }
}
