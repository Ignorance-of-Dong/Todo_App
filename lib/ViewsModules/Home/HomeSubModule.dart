/*
 * @Author: zhangzheng
 * @Date: 2021-03-24 10:52:45
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-24 18:19:36
 * @Descripttion: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Controller/Home/HomeController.dart';
import 'package:todo_app/Controller/MyProfile/MyProfileController.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';

// 首页左上角lead
Widget homeLeadingWidget(BuildContext context) {
  return Builder(
    builder: (ctx) => ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              ButtonStyleButton.allOrNull<Color>(Color(0xFF151026))),
      onPressed: () => {Scaffold.of(ctx).openDrawer()},
      child: Icon(
        Icons.reorder,
        color: Colors.white,
      ),
    ),
  );
}

// 侧边栏主体结构
Widget homeDrawerBuilder(BuildContext context, List<Widget> children) {
  return Drawer(
      child: ListView(
    children: children,
  ));
}

// 侧边栏头像信息
Widget drawerUserInfoWidget(BuildContext context) {
  var goMyProfileDetail = context.read<HomeController>().goMyProfileDetail;
  var avator = context.watch<MyProfileController>().avator;
  var nickName = context.watch<MyProfileController>().nickName;
  var info = context.watch<MyProfileController>().info;
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 250.r,
      margin: EdgeInsets.fromLTRB(20.r, 100.r, 20.r, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(232, 232, 232, 1),
              offset: Offset(1.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 1.0),
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: -70.r,
              child: GestureDetector(
                onTap: () => {goMyProfileDetail(context)},
                child: Container(
                    width: 150.r,
                    height: 150.r,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              offset: Offset(1.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(avator), fit: BoxFit.cover))),
              ),
            ),
            Positioned(
              top: 100.r,
              child: Text(
                nickName,
                style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                top: 160.r,
                child: Container(
                  width: 500.r,
                  child: Text(
                    info,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.grey,
                    ),
                  ),
                ))
          ],
        ),
      ));
}

// 侧边栏功能组
Widget drawerFunctionalGroup(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.fromLTRB(20.r, 50.r, 20.r, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(232, 232, 232, 1),
            offset: Offset(1.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 1.0),
      ],
    ),
    child: Column(
      children: [
        new ListTile(
            //第一个功能项
            title: new Text('First Page'),
            trailing: new Icon(Icons.arrow_upward),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => new SidebarPage()));
            }),
        new ListTile(
            //第二个功能项
            title: new Text('Second Page'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => new SidebarPage()));
            }),
        new ListTile(
            //第二个功能项
            title: new Text('Second Page'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushNamed('/a');
            }),
      ],
    ),
  );
}

// 侧边栏设置组
Widget drawerSettingGroup(BuildContext context) {
  var back = context.read<HomeController>().back;
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.fromLTRB(20.r, 50.r, 20.r, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(232, 232, 232, 1),
            offset: Offset(1.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 1.0),
      ],
    ),
    child: Column(
      children: [
        new ListTile(
          //退出按钮
          title: new Text('Close'),
          trailing: new Icon(Icons.cancel),
          onTap: () => {back(context)}, //点击后收起侧边栏
        ),
      ],
    ),
  );
}

// 天气背景
Widget weatherBackground(BuildContext context) {
  var appbarHeight = AppBar().preferredSize.height;
  return Positioned(
    child: WeatherBg(
        weatherType: WeatherType.hazy,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - appbarHeight),
  );
}
