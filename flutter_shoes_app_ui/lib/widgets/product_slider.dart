import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../myTheme/colors.dart';


class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 20,
        height: 5,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}


class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 5,
        decoration: BoxDecoration(
          color: black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

/*
 * 产品详情界面的滑动
 */
class ProductSlider extends StatefulWidget {
  final List<String>? items;

  const ProductSlider({this.items});

  @override
  _ProductSliderState createState() =>
      _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        // overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(//随着插件更新，若使用旧版本可能会出现首次进入时，图片资源为空--Null check operator used on a null value
              options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setActiveDot(index);
                  },
                autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  autoPlayAnimationDuration: const Duration(seconds: 5),
                  height: 200.0),

              // onPageChanged: (index) {
              //   setActiveDot(index);
              // },
              items: widget.items!.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage("assets/images/"+item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.items!.length, (idx) {
                  return activeIndex == idx ? ActiveDot() : InactiveDot();
                }))
        ],
      ),
    );
  }
}