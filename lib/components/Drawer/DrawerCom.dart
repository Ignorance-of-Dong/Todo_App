/*
 * @Author: zhangzheng
 * @Date: 2020-04-24 19:03:38
 * @LastEditors: zhangzheng
 * @LastEditTime: 2021-03-23 16:17:03
 * @Descripttion: 侧边栏
 */

import 'package:flutter/material.dart';
import 'package:todo_app/Routes/navigatorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @params context 当前容器 【必传】
 * */
class DrawerCom extends StatefulWidget {
  final context;
  DrawerCom({
    Key key,
    @required this.context,
  }) : super(key: key);
  @override
  _DrawerComState createState() => _DrawerComState();
}

class _DrawerComState extends State<DrawerCom> {
  BuildContext context;

  @override
  void initState() {
    this.context = widget.context ?? this.context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      //侧边栏按钮Drawer
      child: new ListView(
        children: <Widget>[
          Container(
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
                        onTap: () => {
                          Histroy().pop(context),
                          Histroy().push(context: context, path: '/myProfile')
                        },
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
                                    image: NetworkImage(
                                        'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                                    fit: BoxFit.cover))),
                      ),
                    ),
                    Positioned(
                      top: 100.r,
                      child: Text(
                        '想上述的说的对你',
                        style: TextStyle(
                            fontSize: 35.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        top: 160.r,
                        child: Container(
                          width: 500.r,
                          child: Text(
                            '想上述的说的对你, 想上述的说的对你,想上述的说的对你, 想上述的说的对你',
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
              )),
          Container(
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
          ),
          Container(
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
                  onTap: () => Navigator.of(context).pop(), //点击后收起侧边栏
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
