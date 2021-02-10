import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:uiChallenges/coffee_berw/constant/color_palett.dart';

import 'detials.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
      buildListItem("res/abo.jpeg" , "150" , ColorPalette().secondSlice),
        buildListItem("res/abo2.jpg" , "250" , ColorPalette().firstSlice),

      ],
    );
  }

  buildListItem(String imagePath, String  price, Color secondSlice)
  {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CoffeeDetails(imagePath: imagePath,headerColor: secondSlice,)));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.transparent,
            ),
          ),
//          Positioned(
//            top: 100.0,
//              child: Container(
//                height: 200.0,
//                width: 250.0,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(25),
//                  image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.none),
//                ),
//              ),
//          ),
//          Positioned(
//            top: 100,
//            child: Container(
//              height: 200,
//              width: 210.0,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(25),
//                color: Colors.white.withOpacity(0.6)
//              ),
//            ),
//          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 260.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: secondSlice.withOpacity(0.9)
              ),
            ),
          ),
          ///for image
          Positioned(
            right: 20.0,

              child: Hero(
                  tag: imagePath,
                  child: Container(
                    height: 230.0,
                    width: 115.0,
                    child:Image(image: AssetImage(imagePath),fit: BoxFit.scaleDown,) ,
                  ),
              ),
          ),
          //section of price and name of coffee
          Positioned(
            top: 125.0,
            left: 15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Price",
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  price+"\ EGP",
                    style: GoogleFonts.bigShouldersText(
                color: Colors.white,
              fontSize: 30.0
          ),
                ),
                SizedBox(height: 30,),
                
                Text("Abo Auf Arabic Coffee  ",
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              SizedBox(height: 2.0,),

              //section review and stars
              Container(
                width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("65 reviews",
                            style: GoogleFonts.bigShouldersText(
                              color: Colors.white,
                              fontSize:18
                            ),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            size: 15,
                            color: Colors.white,
                            borderColor: Colors.white,
                            isReadOnly: true,
                            rating: 3,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 75.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add , size: 17.0,),
                              SizedBox(width: 5.0,),
                              Text("Add",
                                style: GoogleFonts.bigShouldersDisplay(
                                  color: Color(0xFF23163D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              ],
            ),
          )
        ],
      ),
    );

  }

}
