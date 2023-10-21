
import 'dart:core';
import 'dart:core';

import 'package:felkhedma_applications/Screens/orders.dart';
import 'package:felkhedma_applications/Screens/requestScreen.dart';
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerOrderCardWidget extends StatelessWidget {
  int id;
  int workerMobileNumber;
  String orderDetails;
  String orderStatus;

  WorkerOrderCardWidget({
    required this.id ,
    required this.workerMobileNumber ,
    required this.orderDetails ,
    required this.orderStatus

  });



  @override
  Widget build(BuildContext context) {

    double sizeboxHight = 5 ;

    return Stack(
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
                      Text('Order Number : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(
                        id.toString(),
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
                        '$workerMobileNumber',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),

                    ],),
                    SizedBox(height: sizeboxHight,),
                    Flexible(
                      child: Row(children: [
                        Text(' Order details : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                        Flexible(
                          child: Text(
                            orderDetails,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),

                      ],),
                    ),
                    SizedBox(height: sizeboxHight,),
                    Row(children: [
                      Text('Order Status: ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(
                        orderStatus,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),

                    ],)

                  ],
                ),
              ),
            ),
          ),
        ),

        // Positioned(
        //     right: 10,
        //     top: 10,
        //     child: IconButton(onPressed: (){
        //
        //     }, icon: Icon(Icons.favorite , color: Colors.grey.shade300,))
        // ),


      ],
    );
  }
}
