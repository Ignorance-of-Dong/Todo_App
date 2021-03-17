/*
 * @Author: zhangzheng
 * @Date: 2020-12-30 16:12:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-17 11:40:49
 * @Descripttion: 初始页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:todo_app/routes/navigatorUtil.dart';
import "package:images_picker/images_picker.dart";
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_city_picker/city_picker.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // final picker = ImagePicker();
  Map<String, String> userInfo = {
    'nickName': '',
    'school': '',
    'infoDetail': '',
    'date': '',
    'gender': ''
  };
  @override
  void initState() {
    super.initState();
  }

  ///从相册选取
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
  Future<bool> showNickNameDialog() {
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
  Future<bool> showSchoolDialog() {
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

  // 修改简介
  Future<bool> showInfoDialog() {
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
  Future<void> changeGender() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) => ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  ButtonStyleButton.allOrNull<Color>(Color(0xFF151026)),
            ),
            onPressed: () => {Histroy().pop(context)},
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            ),
          ),
        ),
        title: Text('个人资料'),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
              //第一个功能项
              title: Text('头像'),
              trailing: Container(
                  alignment: Alignment.centerRight,
                  width: 250.w,
                  height: 80.h,
                  child: ClipOval(
                    child: Image.network(
                        'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                  )),
              onTap: chooseImage),
          ListTile(
              //第一个功能项
              title: new Text('昵称'),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 250.w,
                height: 50.h,
                child: Text(
                  'j将卡经典款',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                showNickNameDialog();
              }),
          ListTile(
              //第一个功能项
              title: new Text('性别'),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 250.w,
                height: 50.h,
                child: Text(
                  '男',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                changeGender();
              }),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 20.r,
              color: Color.fromRGBO(220, 220, 220, 1)),
          ListTile(
              //第一个功能项
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
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  timeFieldWidth: 100.w,
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
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
              )),
          ListTile(
              //第一个功能项
              title: new Text('地区'),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 250.w,
                height: 50.h,
                child: Text(
                  '北京市',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () async {
                Result result = await CityPicker.showCityPicker(
                    context: context, height: 300, itemBuilder: null);
                print(result);
              }),
          ListTile(
              //第一个功能项
              title: new Text('大学'),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 250.w,
                height: 50.h,
                child: Text(
                  '北京大学',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () async {
                showSchoolDialog();
              }),
          ListTile(
              //第一个功能项
              title: new Text('简介'),
              trailing: Container(
                alignment: Alignment.centerRight,
                width: 250.w,
                height: 50.h,
                child: Text(
                  '崆峒无知，值班一人',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                showInfoDialog();
              }),
        ]).toList()),
      ),
    );
  }
}
