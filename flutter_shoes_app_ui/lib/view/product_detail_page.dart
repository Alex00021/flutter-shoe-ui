import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../myTheme/colors.dart';
import '../widgets/product_slider.dart';


/// 产品详情
class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String img;
  final String price;
  final List<String>? mulImg;
  final List sizes;

  const ProductDetailPage(
      {Key? key, required this.id, required this.name, required this.img, required this.price, required this.mulImg, required this.sizes})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: black.withOpacity(0.1),
                spreadRadius: 1,
              )
            ], borderRadius: BorderRadius.circular(30), color: grey),
            child: Stack(
              children: <Widget>[
                FadeInDown(
                  child: ProductSlider(
                    items: widget.mulImg,
                  ),
                ),
                SafeArea(
                  child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 300),
            child: Image.asset(
              "assets/images/nike_logo.png",
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 350),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "\¥ " + widget.price,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w500, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FadeInDown(
                    delay: const Duration(milliseconds: 450),
                    child: const Text(
                      "尺码",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 450),
                    child: Text(
                      "尺码指南",
                      style: TextStyle(fontSize: 15, color: black.withOpacity(0.7)),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 25,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.sizes.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeSize = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 5, left: 5, top: 5),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: activeSize == index ? black : grey,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius: 1, color: black.withOpacity(0.1))]),
                            child: Center(
                              child: Text(
                                widget.sizes[index],
                                style: TextStyle(fontSize: 22, color: activeSize == index ? white : black),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 550),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius: 1, color: black.withOpacity(0.1))],
                        color: grey),
                    child: Center(
                      child: SvgPicture.asset("assets/images/heart_icon.svg", color: Colors.red,),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: black,
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            child: const Center(
                              child: Text(
                                "加入购物车",
                                style: TextStyle(color: white, fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
