import 'package:felkhedma_applications/Screens/worker_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';
import '../models/userInfo.dart';
import 'HomePage.dart';
import 'RegisterScreen.dart';
import 'WorkerScreen.dart';

class WorkerProfileScreen extends StatefulWidget {
  WorkerProfileScreen({super.key});

  String id = 'workerProfilePage';

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Your Profile Details'),
          leading: IconButton(onPressed: (){
            Navigator.pushNamed(context, WorkerHomePage().id);
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
                hintText: UserInfo().mobile_number,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFiled(
                hintText: UserInfo().customer_city,
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
