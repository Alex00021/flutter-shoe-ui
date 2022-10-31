import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../myTheme/colors.dart';
import 'home_page.dart';

/// 菜单
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List menuItems = ["主页", "新品", "特价", "简介", "退出"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: getBody(),
    );
  }

  ///
  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(menuItems.length, (index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
                        // Navigator.pop(context);
                      },
                      child: ElasticIn(
                        duration: Duration(milliseconds: 400 * index),
                        child: Text(
                          menuItems[index],
                          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ));
              }),
            ))
      ],
    );
  }
}
