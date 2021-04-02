/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 11:36:46
 * @Descripttion: 登录事件操作方法
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';
import 'dart:async';

class RecipesListController with ChangeNotifier {
  List recipesList = [];

  // 获取数据
  Future<void> getRecipesList() async {
    recipesList = [
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data1'
      },
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data2'
      },
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data3'
      }
    ];
  }

  // 上拉加载
  Future<void> handleRefresh() async {
    return Timer(Duration(milliseconds: 5000), () {});
  }

  // 下拉刷新
  Future<void> handleLoad() async {
    return Timer(Duration(milliseconds: 3000), () {});
  }

  // 去详情
  goDetail(BuildContext context, params) {
    var id = params['id'];
    Histroy().push(
        context: context, path: '/recipesDetail?id=${Uri.encodeComponent(id)}');
  }

  // 去搜索
  goSearch(BuildContext context) {
    Histroy().push(context: context, path: '/recipesSearch');
  }
}
