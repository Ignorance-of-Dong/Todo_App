/*
 * @Author: zhangzheng
 * @Date: 2021-04-02 11:50:09
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 15:57:25
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:todo_app/Controller/RecipesSearch/RecipesSearchController.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 搜索输入框
Widget searchWidget(BuildContext context) {
  var handleSearch = context.read<RecipesSearchController>().handleSearch;
  var name = context.watch<RecipesSearchController>().name;
  return TextField(
      controller: name,
      cursorColor: Colors.white,
      autofocus: true,
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white, fontSize: 13.0)),
      onSubmitted: (str) {
        handleSearch(str);
      });
}

// 右侧搜索按钮
Widget searchButtonWidget(BuildContext context) {
  var name = context.watch<RecipesSearchController>().name;
  var handleSearch = context.read<RecipesSearchController>().handleSearch;
  return IconButton(
      icon: Icon(Icons.search), onPressed: () => {handleSearch(name.text)});
}

List<Widget> recipesListWidget(BuildContext context) {
  var recipesList = context.watch<RecipesSearchController>().recipesList;
  var goDetail = context.read<RecipesSearchController>().goDetail;
  List<Widget> view = [];
  for (var i = 0; i < recipesList.length; i++) {
    view
      ..add(GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(30.r, 20.r, 30.r, 20.r),
          height: 250.h,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.grey[300]))),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                width: 150.w,
                height: 250.h,
                child: Image.network(
                  recipesList[i]['cover'],
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 250.h,
                  padding: EdgeInsets.all(30.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipesList[i]['name'],
                        style: TextStyle(fontSize: 32.sp),
                      ),
                      Container(
                        height: 20.h,
                      ),
                      Text(
                        recipesList[i]['remarks'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () => {
          goDetail(context, {'id': recipesList[i]['name']})
        },
      ));
  }
  return view;
}
