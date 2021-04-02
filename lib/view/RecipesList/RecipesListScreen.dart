/*
 * @Author: zhangzheng
 * @Date: 2021-03-25 15:59:58
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 15:48:04
 * @Descripttion: 食谱列表
 */

import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/RecipesList/RecipesListSubModule.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/RecipesList/RecipesListController.dart';

class RecipesListScreen extends StatefulWidget {
  @override
  _RecipesListScreenState createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  @override
  void initState() {
    context.read<RecipesListController>().getRecipesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mainBuilderContainer(context, Text('食谱'),
        recipesListContainer(context), [searchRecipesWidget(context)], null);
  }
}
