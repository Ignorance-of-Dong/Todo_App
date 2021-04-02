/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-25 16:13:16
 * @Descripttion: 首页事件操作方法
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class HomeController with ChangeNotifier {
  // 跳转信息详情
  Future<void> goMyProfileDetail(BuildContext context) async {
    await Histroy().pop(context);
    await Histroy().push(context: context, path: '/myProfile');
  }

  // back
  Future<void> back(BuildContext context) async {
    await Histroy().pop(context);
  }

  // 跳转食谱
  Future<void> goRecipesList(BuildContext context) async {
    await Histroy().pop(context);
    await Histroy().push(context: context, path: '/recipesList');
  }
}
