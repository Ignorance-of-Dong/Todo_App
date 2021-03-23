/*
 * @Author: zhangzheng
 * @Date: 2021-03-19 14:55:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:14:20
 * @Descripttion: 注册事件操作方法
 */

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:flutter_city_picker/city_picker.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';

class MyProfileController with ChangeNotifier {
  String _avator =
      'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg';
  String _nickName = 'j将卡经典款';
  String _gender = '男';
  String _birthday = DateTime.now().toString();
  String _school = '北京大学';
  String _city = '北京市';
  String _info = '崆峒无知，值班一人';

  String get avator => _avator;
  String get nickName => _nickName;
  String get gender => _gender;
  String get birthday => _birthday;
  String get city => _city;
  String get school => _school;
  String get info => _info;

  // 返回
  Future<void> back(BuildContext context) async {
    Histroy().pop(context);
  }

  //从相册选取
  Future<void> chooseImage() async {
    List<Media> res = await ImagesPicker.pick(
      count: 3,
      pickType: PickType.image,
      cropOpt: CropOption(
        aspectRatio: CropAspectRatio.custom,
        cropType: CropType.rect, // currently for android
      ),
    );
    print(res);
  }

  // 修改昵称对话框
  Future<bool> showNickNameDialog(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('请输入昵称'),
          content: TextField(
            maxLength: 10,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            TextButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        );
      },
    );
  }

  // 修改昵称对话框
  Future<bool> showSchoolDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('修改学校'),
          content: TextField(
            maxLength: 10,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            TextButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> selectCity(BuildContext context) async {
    Result result = await CityPicker.showCityPicker(
        context: context, height: 300, itemBuilder: null);
    print(result);
  }

  // 修改简介
  Future<bool> showInfoDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('修改简介'),
          content: TextField(
            maxLines: 5,
            maxLength: 100,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            TextButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        );
      },
    );
  }

  // 选择性别
  Future<void> changeGender(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择性别'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('男'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('女'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "男" : "女"}");
    }
  }
}
