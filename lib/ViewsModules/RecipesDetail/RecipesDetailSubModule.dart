/*
 * @Author: zhangzheng
 * @Date: 2021-03-31 18:08:41
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-01 18:41:20
 * @Descripttion: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Controller/RecipesDetail/RecipesDetailController.dart';
import 'package:provider/provider.dart';

// 封面
Widget recipesCoverWidget(BuildContext context) {
  var detail = context.watch<RecipesDetailController>().recipesDetail;
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 500.h,
    color: Colors.red,
    child: Image.network(
      detail['cover'],
      fit: BoxFit.cover,
    ),
  );
}

Widget recipesTitleWidget(BuildContext context) {
  var detail = context.watch<RecipesDetailController>().recipesDetail;
  return Container(
    padding: EdgeInsets.fromLTRB(30.r, 20.r, 30.r, 20.r),
    margin: EdgeInsets.only(top: 30.r),
    width: MediaQuery.of(context).size.width,
    // color: Colors.yellow,
    child: Text(
      detail['name'] ?? '',
      style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
    ),
  );
}

// 静态标签
Widget labelWidget(BuildContext context, String labelText) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(30.r),
    // color: Colors.green,
    child: Row(
      children: [
        Container(
          width: 10.w,
          height: 40.h,
          margin: EdgeInsets.only(right: 20.r),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(30.r)),
        ),
        Text(labelText)
      ],
    ),
  );
}

// 配料列表
Widget recipesBurdenListWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.r),
    child: Column(
      children: [
        labelWidget(context, '配料'),
        Column(children: listItemWidget(context))
      ],
    ),
  );
}

List<Widget> listItemWidget(BuildContext context) {
  var detail = context.watch<RecipesDetailController>().recipesDetail;
  List<Widget> view = [];
  for (var i = 0; i < detail['burdens'].length; i++) {
    var material = detail['burdens'][i]['material'] ?? '';
    var nums = detail['burdens'][i]['num'] ?? '';
    var unit = detail['burdens'][i]['unit'] ?? '';

    view
      ..add(Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.grey[300]))),
        padding: EdgeInsets.fromLTRB(100.r, 20.r, 100.r, 20.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(material), Text('$nums $unit')],
        ),
      ));
  }
  return view;
}

// 备注
Widget recipesRemarksWidget(BuildContext context) {
  var detail = context.watch<RecipesDetailController>().recipesDetail;

  return Container(
    margin: EdgeInsets.fromLTRB(0, 20.r, 0, 100.r),
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        labelWidget(context, '备注'),
        Container(
          padding: EdgeInsets.fromLTRB(30.r, 0, 30.r, 0),
          child: Text(
            "__ ${detail['remarks']}",
          ),
        )
      ],
    ),
  );
}
