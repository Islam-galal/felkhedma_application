import 'package:felkhedma_applications/Screens/CarpenterHomeScreen.dart';
import 'package:felkhedma_applications/Screens/ElictricalHomeScreen.dart';
import 'package:felkhedma_applications/Screens/PainterHomeScreen.dart';
import 'package:felkhedma_applications/Screens/PlumberScreen.dart';
import 'package:felkhedma_applications/Screens/Customer_profile_page.dart';
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import '../Widgets/CategoryCardWidget.dart';
import 'LoginScreen.dart';
import 'favouritesScreen.dart';
import 'orders.dart';

class HomePage extends StatefulWidget {
  HomePage( {
    Key? key,
  }) : super(key: key);

  String id = 'homepage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('FelKhedma Services'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    UserInfo().customer_name!,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen().id);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(
                  'Orders',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, OrderScreen().id);
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.favorite),
              //   title: Text(
              //     'Favorites',
              //     style: TextStyle(fontSize: 20),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, FavouritesScreen().id);
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {

                  UserInfo().mobile_number = null;
                  UserInfo().customer_name = null ;
                  UserInfo().customer_address = null;
                  UserInfo().customer_city = null ;
                  UserInfo().customer_password = null ;

                  UserInfo().mobile_number = null ;
                  Navigator.pushNamed(context, LoginScreen().id);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Flexible(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PlumberScreen().id);
                    },
                    child: CategoryCardWidgets(
                      categoryName: 'Plumber',
                      categoryImage: 'images/plumber.png',
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, CarpenterScreen().id);
                        },
                        child: CategoryCardWidgets(
                    categoryName: 'Carpenter',
                    categoryImage: 'images/carpenter.png',
                  ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Flexible(
                      child: GestureDetector(
                          onTap: () {

                            Navigator.pushNamed(context, PainterScreen().id);
                          },
                          child: CategoryCardWidgets(
                            categoryName: 'Painter',
                            categoryImage: 'images/painter.png',
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: GestureDetector(
                        onTap: (){

                          Navigator.pushNamed(context, ElictricalScreen().id);
                        },
                        child: CategoryCardWidgets(
                    categoryName: 'Electrical',
                    categoryImage: 'images/electrical.png',
                  ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
//
//   Future getData() async{
//     var url = 'http://127.0.0.1:8080/Users/islamgalal/Downloads/script.php';
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     await request.send().then((result) {
//
//       http.Response.fromStream(result).then((response) {
//
//         var message = jsonDecode(response.body);
//
//         print(message.toString());
//
//       });
//
//     });
//
//   }
}
