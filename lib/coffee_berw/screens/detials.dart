import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiChallenges/coffee_berw/constant/color_palett.dart';

class CoffeeDetails extends StatefulWidget {
  final imagePath,headerColor;

  CoffeeDetails({this.imagePath, this.headerColor});

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            color: ColorPalette().leftBarColor,
          ),
          Container(
            height: screenHeight/2,
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: CupertinoColors.white
            ),
          ),
          Container(
            height: (screenHeight /4 + 25.0),
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              image: DecorationImage(image: AssetImage("res/abo.jpeg"),fit: BoxFit.none),
            ),
          ),
          Container(
            height: (screenHeight /4 + 25.0),
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Container(
            height: (screenHeight /4 + 25.0),
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: widget.headerColor.withOpacity(0.9),
            ),
          ),
          Positioned(top: 35.0, left: 20.0, child: Icon(Icons.arrow_back_ios)),
          Positioned(top: 35.0, right: 20.0, child: Icon(Feather.shopping_bag)),
          
          Positioned(
            top: (screenHeight /4 - 100.0),
            left: (screenWidth/4),
            child:Hero(
                tag: widget.imagePath,
                child: Image(
                    image: AssetImage(
                        widget.imagePath
                    ),
                  width: 175.0,
                  height: 175.0,
                  fit:BoxFit.cover ,
                ),
            ) ,
          ),
          Positioned(
            top: (screenHeight / 4 ) + 85.5,
              left: screenWidth/7,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Abo Auf Arabic Coffee  ",
                      style: GoogleFonts.bigShouldersText(
                          color: Color(0xFF23163D),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                    children: <Widget>[
                      Icon(Feather.user),
                      SizedBox(width: 10,),
                      Text("1.5 K",
                        style: GoogleFonts.bigShouldersText(
                            color: ColorPalette().firstSlice,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 15.5,),
                      Container(
                        width: 1.0,
                        height: 20.0,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 15,),
                      Icon(Feather.star),
                      SizedBox(width: 10,),
                      Text("4.0 K",
                        style: GoogleFonts.bigShouldersText(
                            color: ColorPalette().firstSlice,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 15.5,),
                      Container(
                        width: 1.0,
                        height: 20.0,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 15,),
                      Icon(Feather.anchor),
                      SizedBox(width: 10,),
                      Text("No.1",
                        style: GoogleFonts.bigShouldersText(
                            color: ColorPalette().firstSlice,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 15.5,),

                    ]
                  ),
                ],
                ),
              ),
          ),
          Positioned(
            top: screenHeight / 2 +10.0,
            left: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("About Us",
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: screenWidth -40.0,
                  child: Text(
                      "Arabic Coffee is coffee made arab style, it's sometimes called turkish coffee with a great taste",
                    style: GoogleFonts.bigShouldersText(
                      color: Color(0xFFB5ABB8),
                      fontSize: 18.0
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150.0,
                  width: screenWidth,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildOneItem('\65 EGP',"res/turr.jpg"),
                      SizedBox(width: 20.0,),
                      buildOneItem("\80 EGP" ,"res/arabic2.jpg" )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 225,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorPalette().buttonColor,
                      ),
                      child: Center(
                        child: Text("BUY NOW",
                          style: GoogleFonts.bigShouldersText(
                            color: Colors.white,
                            fontSize: 20.0

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: ColorPalette().buttonColor,
                          width: 2
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Feather.bookmark , size: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildOneItem(String price ,String ImagePath) {
    return Stack(
      children: <Widget>[
        Container(
          height: 125,
          width: 200,
          color: Colors.transparent,
        ),
        Positioned(
          top: 50,
            child: Container(
              height:75 ,
             width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(blurRadius: 4.0,color: Colors.grey.withOpacity(0.2),spreadRadius: 2.0 )
              ],
                color: Colors.white,
              ),
            ),
        ),
        Positioned(
          right:5 ,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImagePath),fit: BoxFit.scaleDown)
            ),
          ),
        ),
        Positioned(
          left: 10.0,
            top: 60.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(price,
                  style: GoogleFonts.bigShouldersText(
                      color: ColorPalette().firstSlice,
                      fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Turkish Coffee",
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
        ),
      ],
    );
  }
}
