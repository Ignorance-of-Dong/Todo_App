/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 15:56:28
 * @Descripttion: 食谱搜索操作事件
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class RecipesSearchController with ChangeNotifier {
  dynamic recipesDetail = {};
  List recipesList = [];
  TextEditingController _name = TextEditingController();

  TextEditingController get name => _name;
  // 获取详情
  handleSearch(String name) {
    recipesList = [
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data1$name',
        'remarks':
            '离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊'
      },
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data2$name',
        'remarks':
            '离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊'
      },
      {
        'cover':
            'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
        'name': 'data3$name',
        'remarks':
            '离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊'
      }
    ];
    notifyListeners();
  }

  back(BuildContext context) {
    recipesList = [];
    _name = TextEditingController();
    notifyListeners();
    FocusScope.of(context).requestFocus(FocusNode());
    Histroy().pop(context);
  }

  // 去详情
  goDetail(BuildContext context, params) {
    var id = params['id'];
    Histroy().push(
        context: context, path: '/recipesDetail?id=${Uri.encodeComponent(id)}');
  }
}
