/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:18:04
 * @Descripttion: 登录事件操作方法
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class LoginController with ChangeNotifier {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int math = 0;

  TextEditingController get username => _username;
  TextEditingController get password => _password;
  GlobalKey<FormState> get formKey => _formKey;

  // 登录点击事件
  handleLogin(BuildContext context) {
    print("111");
    if (_formKey.currentState.validate()) {
      Histroy().push(
        context: context,
        path: '/initial',
      );
    } else {
      print('校验失败');
      math = math + 1;
      print(math);
      notifyListeners();
    }
  }
}
