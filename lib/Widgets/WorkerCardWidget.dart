
import 'dart:core';
import 'dart:core';

import 'package:felkhedma_applications/Screens/orders.dart';
import 'package:felkhedma_applications/Screens/requestScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/userInfo.dart';

class WorkerCardWidget extends StatelessWidget {
  String workerName;
  int workerMobileNumber;
  String workerCraft;
  String workerCity;

  WorkerCardWidget({
   required this.workerName ,
    required this.workerMobileNumber ,
    required this.workerCraft ,
    required this.workerCity

  });



  @override
  Widget build(BuildContext context) {

    TextEditingController workernameTOsend = new TextEditingController();
    TextEditingController workerNumberTOsend = new TextEditingController();

    double sizeboxHight = 5 ;

    List<String> passedData = [ workerName , workerMobileNumber.toString()];

    return TextButton(
      onPressed: (){

        UserInfo().worker_nameInOrder = workerName;
        UserInfo().worker_MobileNumberInOrder = workerMobileNumber.toString();

        Navigator.pushNamed(context, RequestScreen().id);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                )
              ]),
              height: 150,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Row(children: [
                       Text('Worker name is : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                       Text(
                         workerName,
                         style: TextStyle(
                           color: Colors.grey,
                           fontSize: 18,
                         ),
                       ),
                     ],),
                      SizedBox(height: sizeboxHight,),
                      Row(children: [
                        Text('Worker Mobile Number : ',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(
                          workerMobileNumber.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),

                      ],),
                      SizedBox(height: sizeboxHight,),
                      Row(children: [
                        Text('Worker Craft : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(
                          workerCraft,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),

                      ],),
                      SizedBox(height: sizeboxHight,),
                      Row(children: [
                        Text('Worker city : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(
                          workerCity,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),

                      ],),

                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   right: 10,
          //   top: 10,
          //   child: IconButton(onPressed: (){
          //
          //   }, icon: Icon(Icons.favorite , color: Colors.grey.shade300,))
          // ),

        ],
      ),
    );
  }
}
