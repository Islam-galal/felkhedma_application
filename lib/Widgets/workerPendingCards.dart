
import 'dart:core';
import 'dart:core';

import 'package:felkhedma_applications/Screens/orders.dart';
import 'package:felkhedma_applications/Screens/requestScreen.dart';
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Screens/favouritesScreen.dart';

class WorkerPendingCardWidget extends StatelessWidget {
  int orderId;
  int customeMobileNumber;
  int workerMobileNumber;
  String customer_OrderDetails;

  WorkerPendingCardWidget({
    required this.orderId ,
    required this.customeMobileNumber ,
    required this.workerMobileNumber ,
    required this.customer_OrderDetails

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
                        orderId.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],),
                    SizedBox(height: sizeboxHight,),
                    Row(children: [
                      Text('Customer Number : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(
                        customeMobileNumber.toString(),
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
                      Text('Customer Order details : ' ,style: TextStyle(fontWeight: FontWeight.bold),),
                      Flexible(
                        child: Text(
                          customer_OrderDetails,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),

                    ],),
                    SizedBox(height: sizeboxHight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SizedBox(width: 10,),
                      TextButton(onPressed: () async{

                        await supabase
                            .from('orders')
                            .update({ 'status': 'approved' }).match(
                            {'id': orderId});

                        var snackBar =SnackBar(content: Text("Request hass been Approved"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);


                      }, child:Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 100,

                          height: 50,
                          child: Center(child: Text('Approve' , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold , color: Colors.black),))), ),
                      SizedBox(width: 10,),
                      TextButton(onPressed: () async{


                        await supabase
                            .from('orders')
                            .update({ 'status': 'rejected' }).match(
                            {'id': orderId});

                        var snackBar =SnackBar(content: Text("Request hass been Rejected"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }, child:Container(

                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 100,
                          height: 50,
                          child: Center(child: Text('Reject' , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold , color: Colors.black),))), )

                    ],)



                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
