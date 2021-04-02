/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-01 18:33:46
 * @Descripttion: 食谱详情操作事件
 */

import 'package:flutter/material.dart';

class RecipesDetailController with ChangeNotifier {
  dynamic recipesDetail = {};
  // 获取详情
  getRecipesDetail(String id) {
    recipesDetail = {
      'cover':
          'https://img-pre.ivsky.com/img/tupian/pre/202008/31/meishi_sheying-001.jpg',
      'name': '快乐精灵',
      'burdens': [
        {'material': '豆浆', 'num': '22', 'unit': '克'},
        {'material': '豆浆', 'num': '22', 'unit': '克'},
        {'material': '豆浆', 'num': '22', 'unit': '克'}
      ],
      'remarks':
          '离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊离开家阿列克就是快乐的经历卡进垃圾堆里卡嘉陵道街拉开距离看得见啊'
    };
  }
}
