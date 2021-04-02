/*
 * @Author: zhangzheng
 * @Date: 2021-01-15 17:10:57
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 11:41:29
 * @Descripttion: 
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/View/Login/LoginScreen.dart';
import 'package:todo_app/View/Register/RegisterScreen.dart';
import 'package:todo_app/View/Home/HomeScreen.dart';
import 'package:todo_app/View/MyProfile/MyProfileScreen.dart';
import 'package:todo_app/View/RecipesList/RecipesListScreen.dart';
import 'package:todo_app/View/RecipesDetail/RecipesDetailScreen.dart';
import 'package:todo_app/View/RecipesSearch/RecipesSearchScreen.dart';

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

// 食谱列表
var recipesListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print(params);
  // Application.router.navigateTo(context, path)
  return new RecipesListScreen();
});
// 食谱列表
var recipesDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print(params['id']);
  // Application.router.navigateTo(context, path)
  return new RecipesDetailScreen(id: params['id'][0]);
});
// 食谱查询
var recipesSearchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  // Application.router.navigateTo(context, path)
  return new RecipesSearchScreen();
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
