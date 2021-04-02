/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:07:32
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 11:34:29
 * @Descripttion: 定义路由模块
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './navigatorUtil.dart';
import './routerHandler.dart';

///路由模块定义
class Routes {
  static String root = '/'; //根目录
  static void configureRoutes(FluroRouter router) {
    ///无法获取路由，路由错误，返回当前页
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return Histroy().pop(context);
    });

    // ================Router================
    router.define('/login', handler: loginHandler);
    router.define('/register', handler: registerHandler);
    router.define('/initial', handler: homeHandler);
    router.define('/myProfile', handler: myProfileHandler);
    router.define('/recipesList', handler: recipesListHandler);
    router.define('/recipesDetail', handler: recipesDetailHandler);
    router.define('/recipesSearch', handler: recipesSearchHandler);
    // ================Router================
  }
}
