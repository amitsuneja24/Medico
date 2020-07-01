import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/ui/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

import 'login.dart';

final List<String> imgList=[
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  'assets/images/5.jpg',
  'assets/images/6.jpg'
];

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Builder(
                builder: (context) {
                  final double height = MediaQuery
                      .of(context)
                      .size
                      .height;
                  return CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio:0.57 ,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        reverse: false
                    ),
                    items: imgList.map((item) =>
                        Center(
                            child: Image.asset(
                              item, fit: BoxFit.cover, height: height,)
                        ),
                    ).toList(),
                  );
                }
            ),
            InkWell(
              //borderRadius: BorderRadius.circular(14),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()))
              },
              highlightColor: Colors.white70,
              child: Flexible(
               // flex: 50,
                child: Container(

                  child: Text('Login/SignUp',style: TextStyle(color: Colors.white70,fontSize: 22),),
                  alignment: Alignment.center,
                  height: 49,

                  color: Color(0xFF00796B),
                ),
              ),
            ),
          ],
        ));
  }


}