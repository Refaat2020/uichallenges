

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _googleMapController;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: ThemeData(
        accentColor: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(51.507083, -0.126945),
                  zoom: 18,

                ),
              onMapCreated: (gmc){
                  _googleMapController = gmc;

              },
            ),
            ///for search field
            Positioned(
              left: 16,
                right: 16,
                top: 48,
                child:Container(
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search,color: Colors.teal,),
                        suffixIcon: Icon(Icons.tune,color: Colors.teal),
                      border: InputBorder.none,
                      hintText: "Search ..."
                    ),
                  ),
                ),
            ),
            ///for floating buttons
            Positioned(
              right: 16,
                top: 200,

                child: Column(
                   children: [
                     FloatingActionButton(
                       heroTag: "adds",
                         child: Icon(Icons.add,color: Colors.teal,size: 38,),
                         backgroundColor: Colors.white,
                         onPressed: (){}),
                     SizedBox(height: 16,),
                     FloatingActionButton(
                         heroTag: "minus",
                         child: Icon(Icons.remove,color: Colors.teal,size: 38,),
                         backgroundColor: Colors.white,
                         onPressed: (){}),
                     SizedBox(height: 32,),
                     FloatingActionButton(
                         heroTag: "location",
                         child: Icon(Icons.my_location,color: Colors.teal,size: 38,),
                         backgroundColor: Colors.white,
                         onPressed: (){}),
                   ],
                ),
            ),

            Positioned(
              left: 16,
                right: 16,
                bottom: 16,
                child:Container(
                  height: 280,
                  width: screenWidth,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5
                      )
                    ]
                  ),
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
                          child: Stack(
                            children: [
                              Positioned(
                                right: 16,
                                  top: 16,

                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.favorite_border , color: Colors.white,),))
                            ],
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
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                                      child:  Center(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.star_border),

                                          Text("4.5",style: TextStyle(color: Colors.teal),),
                                        ],
                                      ))

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
