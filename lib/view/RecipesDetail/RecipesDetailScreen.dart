/*
 * @Author: zhangzheng
 * @Date: 2021-03-31 17:40:37
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 15:47:57
 * @Descripttion: 食谱详情
 */

import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/RecipesDetail/RecipesDetailSubModule.dart';
import 'package:todo_app/Controller/RecipesDetail/RecipesDetailController.dart';
import 'package:provider/provider.dart';

class RecipesDetailScreen extends StatefulWidget {
  final id;
  RecipesDetailScreen({Key key, @required this.id}) : super(key: key);
  @override
  _RecipesDetailScreenState createState() => _RecipesDetailScreenState();
}

class _RecipesDetailScreenState extends State<RecipesDetailScreen> {
  String id = '';
  @override
  void initState() {
    context.read<RecipesDetailController>().getRecipesDetail(widget.id ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mainBuilderContainer(
        context,
        Text("详情$id"),
        ListView(
          children: [
            recipesCoverWidget(context),
            recipesTitleWidget(context),
            recipesBurdenListWidget(context),
            recipesRemarksWidget(context)
          ],
        ),
        [],
        null);
  }
}
