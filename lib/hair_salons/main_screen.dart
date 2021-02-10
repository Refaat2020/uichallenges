
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uiChallenges/hair_salons/map_screen.dart';
import 'package:uiChallenges/hair_salons/shop_model.dart';
import 'package:uiChallenges/video.dart';
import 'package:video_player/video_player.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ShopModel>items = [
    ShopModel(
      name: "Danic Schaefer HairStylist",
      imagePath: "https://p0.pikist.com/photos/992/216/haircut-barber-hair-salon-barber-shop-scissors-comb-grooming-trim.jpg",
      rate: 4.1
    ),
    ShopModel(
        name: "Royalty Barbershop",
        imagePath: "https://i1.wp.com/www.bcomminc.com/fcnpwp/wp-content/uploads/2011/08/FATHERANDSONpapergood.jpg?resize=600%2C400",
        rate: 4.5
    ),
    ShopModel(
        name: "Danic Schaefer HairStylist",
        imagePath: "https://p0.pikist.com/photos/992/216/haircut-barber-hair-salon-barber-shop-scissors-comb-grooming-trim.jpg",
        rate: 4.2
    ),
    ShopModel(
        name: "Royalty Barbershop",
        imagePath: "https://p0.pikist.com/photos/992/216/haircut-barber-hair-salon-barber-shop-scissors-comb-grooming-trim.jpg",
        rate: 4.0
    ),

  ];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 64,),
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 12,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Hair Salons",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                  Icon(Icons.search,color: Colors.grey,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.teal,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MapScreen()));
                    },
                      child: Text("ASAP -- Prince George's Park",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
            height: 240,
              padding: EdgeInsets.only(left: 16),
              width: screenWidth,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return Container(
                  width: 180,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: NetworkImage(items[index].imagePath),fit: BoxFit.cover,),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8 , right: 8,bottom: 16,top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                        Container(
                          height: 42,
                            width: 61,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.star_border,color: Colors.white,),
                              Text(items[index].rate.toString(),style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                          SizedBox(
                            width: 180,
                            child: Text(items[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
                          ),
                        ],
                      ),
                    ),
                  );
                  },
              ),
            ),
          Padding(
              padding: EdgeInsets.only(left: 16,top: 16,bottom:8 ),
            child: Text(
              "Recent",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
            Container(
              height: 360,

              child: ListView.builder(
                shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context,index){
                return Container(
                  height: 280,
                  width: screenWidth,
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(left:16,top: 8,right: 16 ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              color: Colors.red,
                              image: DecorationImage(image: NetworkImage("https://i0.wp.com/metro.co.uk/wp-content/uploads/2020/03/GettyImages-626538915-e1584632368583.jpg?quality=90&strip=all&zoom=1&resize=644%2C428&ssl=1"),fit:BoxFit.cover )
                            ),
                          ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 16,top: 8,right: 16),

                          decoration: BoxDecoration(
                              color: Colors.white,

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Rogue and Beyond"),
                              Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.grey,),
                                  SizedBox(width: 8,),
                                  Text("174A Telok ayae st",
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    height: 34,
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Icon(Icons.timer,color: Colors.teal,),
                                        Text("11:00-22:00",style: TextStyle(color: Colors.teal),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16,),
                                  Container(
                                    height: 34,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(16)
                                    ),

                                    child:  Center(child: Text("4.5",style: TextStyle(color: Colors.teal),))

                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );

              }),
            )
          ],

        ),
      ),
    );
  }
}
