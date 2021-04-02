/*
 * @Author: zhangzheng
 * @Date: 2021-04-02 11:32:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 15:52:17
 * @Descripttion: 查询
 */

import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/RecipesSearch/RecipesSearchSubModule.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/RecipesSearch/RecipesSearchController.dart';

class RecipesSearchScreen extends StatefulWidget {
  @override
  _RecipesSearchScreenState createState() => _RecipesSearchScreenState();
}

class _RecipesSearchScreenState extends State<RecipesSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var back = context.read<RecipesSearchController>().back;
    return mainBuilderContainer(
        context,
        searchWidget(context),
        ListView(
          children: recipesListWidget(context),
        ),
        [searchButtonWidget(context)],
        back);
  }
}
