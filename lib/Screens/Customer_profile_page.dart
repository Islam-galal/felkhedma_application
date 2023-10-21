import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';
import 'HomePage.dart';
import 'RegisterScreen.dart';
import 'WorkerScreen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  String id = 'CustomerprofilePage';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Your Profile Details'),
          leading: IconButton(onPressed: (){
            Navigator.pushNamed(context, HomePage().id);
          }, icon: Icon(Icons.arrow_back))

      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [

              SizedBox(height: 30,),


              SizedBox(
                height: 20,
              ),
              CustomTextFiled(
                hintText: UserInfo().customer_name,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFiled(
                hintText: UserInfo().customer_name,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFiled(
                hintText: UserInfo().customer_address,
              ),
              SizedBox(
                height: 20,
              ),




            ],
          ),
        ),
      ),

    );
  }
}
