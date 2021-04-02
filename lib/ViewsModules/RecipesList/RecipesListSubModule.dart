/*
 * @Author: zhangzheng
 * @Date: 2021-03-25 16:03:20
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-04-02 16:28:22
 * @Descripttion: 食谱列表子模块
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frefresh/frefresh.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Controller/RecipesList/RecipesListController.dart';

// recipes Container
Widget recipesListContainer(BuildContext context) {
  FRefreshController controller = FRefreshController();
  String loadingText = 'Drop-down to loading';
  var handleLoad = context.read<RecipesListController>().handleLoad;
  var handleRefresh = context.read<RecipesListController>().handleRefresh;
  var recipesList = context.watch<RecipesListController>().recipesList;
  return FRefresh(
    controller: controller,
    footerBuilder: (setter) {
      controller.setOnStateChangedCallback((state) {
        setter(() {
          if (controller.loadState == LoadState.PREPARING_LOAD) {
            loadingText = 'Release to load';
          } else if (controller.loadState == LoadState.LOADING) {
            loadingText = 'Loading..';
          } else if (controller.loadState == LoadState.FINISHING) {
            loadingText = 'Loading completed';
          } else {
            loadingText = 'Drop-down to loading';
          }
        });
      });
      return loadingBuilderWidget(loadingText);
    },
    headerBuilder: (setter, constraints) {
      controller.setOnStateChangedCallback((state) {
        print(controller.refreshState);
        setter(() {
          if (controller.refreshState == RefreshState.PREPARING_REFRESH) {
            loadingText = '松开刷新';
          } else if (controller.refreshState == RefreshState.REFRESHING) {
            loadingText = 'Loading..';
          } else if (controller.refreshState == RefreshState.FINISHING) {
            loadingText = '刷新结束';
          } else {
            loadingText = '下拉进行刷新';
          }
        });
      });
      return loadingBuilderWidget(loadingText);
    },
    headerHeight: 100.h,
    footerHeight: 100.h,
    child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 4 / 5,
        children: List.generate(recipesList.length, (index) {
          return recipesItemWidget(context, recipesList[index]);
        })),
    onLoad: () async {
      await handleLoad();
      controller.backOriginOnLoadFinish = true;
      controller.finishLoad();
    },
    onRefresh: () async {
      await handleRefresh();
      controller.finishRefresh();
    },
  );
}

// 加载效果Widget
Widget loadingBuilderWidget(String loadingText) {
  return Container(
      height: 38,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              strokeWidth: 2.0,
            ),
          ),
          const SizedBox(width: 9.0),
          Text(
            loadingText,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ));
}

// recipes item
Widget recipesItemWidget(BuildContext context, item) {
  print(item);
  var goDetail = context.read<RecipesListController>().goDetail;
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(232, 232, 232, 1),
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 4.0),
          ]),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.network(item['cover'], fit: BoxFit.cover,
                    frameBuilder: (BuildContext context, Widget child,
                        int frame, bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;

                  return AnimatedOpacity(
                    child: child,
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                })),
          ),
          Container(
            height: 100.r,
            child: Center(
              child: Text(item['name']),
            ),
          )
        ],
      ),
    ),
    onTap: () => {
      goDetail(context, {'id': item['name']})
    },
  );
}

// 搜索
Widget searchRecipesWidget(BuildContext context) {
  var goSearch = context.read<RecipesListController>().goSearch;
  return IconButton(
      icon: Icon(Icons.search), onPressed: () => {goSearch(context)});
}
