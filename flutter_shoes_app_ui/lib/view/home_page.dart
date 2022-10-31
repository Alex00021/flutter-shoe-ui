import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/view/product_detail_page.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/product_data.dart';
import '../myTheme/colors.dart';
import '../widgets/app_bar.dart';

///@program: flutter_shoes_app_ui
///@description:
///@author: Alex.LingJiaHua
///@create: 2022

/// 主页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(context),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "运动鞋",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Row(
                children: const <Widget>[
                  Text(
                    "筛选",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              )
            ],
          ),
        ),
        Column(
            children: List.generate(products.length, (index) {
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                                id: products[index]["id"].toString(),
                                name: products[index]["name"],
                                img: products[index]["img"],
                                price: products[index]["price"],
                                mulImg: products[index]["mul_img"],
                                sizes: products[index]["sizes"],
                              )));
                },
                child: Container(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: grey,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(spreadRadius: 1, color: black.withOpacity(0.1), blurRadius: 2)]),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 280,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/" + products[index]["img"]),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            products[index]["name"],
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "\¥ " + products[index]["price"],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 10,
                        child: IconButton(
                            icon: SvgPicture.asset("assets/images/heart_icon.svg"),
                            onPressed: null))
                  ],
                )),
              ),
            ),
          );
        }))
      ],
    );
  }
}
