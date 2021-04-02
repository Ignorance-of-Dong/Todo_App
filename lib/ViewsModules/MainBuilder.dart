/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 11:38:51
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 16:01:41
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

// 首页主体结构
Widget initialBuilderContainer(BuildContext context, List<Widget> childern) {
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
Widget homeBuilderContainer(BuildContext context, Widget leading, Widget drawer,
    List<Widget> childern) {
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
      child: Stack(
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

// 登录后页面主体
Widget mainBuilderContainer(BuildContext context, Widget centerWidget,
    Widget child, List<Widget> actions, backCallback) {
  back(context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Histroy().pop(context);
  }

  var handleCallback = backCallback ?? back;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      leading: Builder(
        builder: (ctx) => ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                ButtonStyleButton.allOrNull<Color>(Color(0xFF151026)),
          ),
          onPressed: () => {handleCallback(context)},
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
        ),
      ),
      actions: actions,
      title: centerWidget,
      centerTitle: true,
      brightness: Brightness.dark,
    ),
    body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: child),
  );
}
