/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:10:45
 * @Descripttion: 我的资料
 */
import 'package:flutter/material.dart';
import 'package:todo_app/ViewsModules/MainBuilder.dart';
import 'package:todo_app/ViewsModules/MyProfile/MyProfileSubModule.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return myProfileBuilderContainer(context, leadingWidget(context), [
      myProfileAvatarWidget(context),
      myProfileNickNameWidget(context),
      myProfileGenderWidget(context),
      myProfileBirthdayWidget(context),
      myProfileCityWidge(context),
      myProfileSchoolWidge(context),
      myProfileInfoWidge(context)
    ]);
  }
}
