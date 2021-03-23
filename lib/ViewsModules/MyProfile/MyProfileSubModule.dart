/*
 * @Author: zhangzheng
 * @Date: 2021-03-23 15:15:30
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:11:53
 * @Descripttion: 我的信息子模块
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:todo_app/Controller/MyProfile/MyProfileController.dart';
import 'package:provider/provider.dart';

// 头部返回按钮
Widget leadingWidget(BuildContext context) {
  var back = context.read<MyProfileController>().back;
  return Builder(
    builder: (ctx) => ElevatedButton(
      style: ButtonStyle(
        backgroundColor: ButtonStyleButton.allOrNull<Color>(Color(0xFF151026)),
      ),
      onPressed: () => {back(context)},
      child: Icon(
        Icons.keyboard_backspace,
        color: Colors.white,
      ),
    ),
  );
}

// 用户头像
Widget myProfileAvatarWidget(BuildContext context) {
  var avator = context.watch<MyProfileController>().avator;
  var chooseImage = context.read<MyProfileController>().chooseImage;
  return ListTile(
      title: Text('头像'),
      trailing: Container(
          alignment: Alignment.centerRight,
          width: 250.w,
          height: 80.h,
          child: ClipOval(
            child: Image.network(avator),
          )),
      onTap: chooseImage);
}

// 用户昵称
Widget myProfileNickNameWidget(BuildContext context) {
  var nickName = context.watch<MyProfileController>().nickName;
  var showNickNameDialog =
      context.read<MyProfileController>().showNickNameDialog;
  return ListTile(
      //第一个功能项
      title: new Text('昵称'),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 250.w,
        height: 50.h,
        child: Text(
          nickName,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () => {showNickNameDialog(context)});
}

// 用户性别
Widget myProfileGenderWidget(BuildContext context) {
  var gender = context.watch<MyProfileController>().nickName;
  var changeGender = context.read<MyProfileController>().changeGender;
  return ListTile(
      //第一个功能项
      title: new Text('性别'),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 250.w,
        height: 50.h,
        child: Text(
          gender,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        changeGender(context);
      });
}

// 用户生日
Widget myProfileBirthdayWidget(BuildContext context) {
  var birthday = context.watch<MyProfileController>().birthday;
  return ListTile(
      title: new Text('生日'),
      trailing: Container(
        width: 250.w,
        height: 50.h,
        alignment: Alignment.centerRight,
        child: DateTimePicker(
          textAlign: TextAlign.right,
          decoration: InputDecoration(border: InputBorder.none),
          type: DateTimePickerType.date,
          dateMask: 'yyyy/MM/dd',
          initialValue: birthday,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          dateLabelText: 'Date',
          timeFieldWidth: 100.w,
          selectableDayPredicate: (date) {
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }

            return true;
          },
          onChanged: (val) => print(val),
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        ),
      ));
}

// 用户城市
Widget myProfileCityWidge(BuildContext context) {
  var city = context.watch<MyProfileController>().city;
  var selectCity = context.read<MyProfileController>().selectCity;
  return ListTile(
      title: new Text('地区'),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 250.w,
        height: 50.h,
        child: Text(
          city,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        selectCity(context);
      });
}

// 用户大学
Widget myProfileSchoolWidge(BuildContext context) {
  var school = context.watch<MyProfileController>().school;
  var showSchoolDialog = context.read<MyProfileController>().showSchoolDialog;
  return ListTile(
      //第一个功能项
      title: new Text('大学'),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 250.w,
        height: 50.h,
        child: Text(
          school,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () async {
        showSchoolDialog(context);
      });
}

// 用户简介
Widget myProfileInfoWidge(BuildContext context) {
  var info = context.watch<MyProfileController>().info;
  var showInfoDialog = context.read<MyProfileController>().showInfoDialog;
  return ListTile(
      //第一个功能项
      title: new Text('简介'),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 250.w,
        height: 50.h,
        child: Text(
          info,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        showInfoDialog(context);
      });
}
