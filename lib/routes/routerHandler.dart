/*
 * @Author: zhangzheng
 * @Date: 2021-01-15 17:10:57
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-24 10:39:41
 * @Descripttion: 
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../View/Login/LoginScreen.dart';
import '../View/Register/RegisterScreen.dart';
import '../View/Home/HomeScreen.dart';
import '../View/MyProfile/MyProfileScreen.dart';

// 路由模块获取，以及获取传递参

// 登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  // Application.router.navigateTo(context, path)
  return new LoginScreen();
});

// 注册页
var registerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  // Application.router.navigateTo(context, path)
  return new RegisterScreen();
});

// 初始页面
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  // Application.router.navigateTo(context, path)
  return new HomeScreen();
});

// 个人资料
var myProfileHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  // Application.router.navigateTo(context, path)
  return new MyProfileScreen();
});

// 登录页 => 密码
// var pwdHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   print(params);
//   // Application.router.navigateTo(context, path)
//   return new PwdScreen(
//     phoneMobile: params['phoneMobile'][0],
//   );
// });

// var webViewHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params);
//     return SearchScreen();
//   }
// );

// var homePageSreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params);
//     return HomePageSreen();
//   }
// );

// var songlistdetailsScreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     // print(params['id'][0]);
//     return SongListDetails(id: params['id'][0].toString());
//   }
// );

// var musicpalyerScreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params['id'][0].toString());
//     return MusicPlaayerSreens(id: params['id'][0].toString());
//   }
// );
