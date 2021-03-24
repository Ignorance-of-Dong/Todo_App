/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-24 18:19:46
 * @Descripttion: 首页
 */
import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/Home/HomeSubModule.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> currentTime = ValueNotifier<String>("1");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return homeBuilderContainer(
        context,
        homeLeadingWidget(context),
        homeDrawerBuilder(context, [
          drawerUserInfoWidget(context),
          drawerFunctionalGroup(context),
          drawerSettingGroup(context)
        ]),
        [
          weatherBackground(context),
          Container(
            child: Text('111'),
          )
        ]);
  }
}
