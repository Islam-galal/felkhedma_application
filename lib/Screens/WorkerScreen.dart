import 'package:felkhedma_applications/Screens/worker_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';

import '../models/userInfo.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';

class WorkerScreen extends StatefulWidget {
   WorkerScreen({super.key});
   String id = "registerScreenForWorker";

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {

  // final myController = TextEditingController();


  List<String> worker_citylist = [
  'Cairo ',
  'Giza',
  'Alex',
  'El Monofya',
  'El Qalubaya',
  'Aswan',
  'El Oksor' ,
  'Banha' ,
  'Zakazee' ,
  'Bahary' ,
  'Marsa Matroh' ,
  'El Qena' ,
  'Bani Swaf' ,];

  String? worker_citylistSelected = 'Cairo ';


  List<String> worker_craftlist = [
    'Plamber ',
    'Carpenter',
    'Painter',
    'Electrical',
  ];
  String? worker_craftSelecteditem = 'Plamber ';

  String? worker_mobileNumber , worker_name , worker_address , worker_city = 'Cairo' , worker_craft = 'Plamber', worker_password;

  GlobalKey<FormState> formKey =  GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [

                Image.asset('images/app_logo.png' , height: 200,) ,
                SizedBox(height: 30,),
                Center(
                  child: Text(
                    "Felkhedma Servcies ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Register as Worker ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFiled(
                  text: TextInputType.number,
                  hintText: 'Enter your Mobile number',
                    onChanged: (data){
                      worker_mobileNumber = data ;

                    }

                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFiled(
                  hintText: 'Enter your Full name',
                    onChanged: (data){
                      worker_name = data ;

                    }
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFiled(
                  obscureText: true,
                  hintText: 'Enter your Password',
                    onChanged: (data){
                      worker_password = data ;

                    }
                ),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.grey))),
                    value: worker_citylistSelected,
                    items: worker_citylist
                        .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        )))
                        .toList(),
                    onChanged: (item) => setState(() {
                        worker_city = item;

                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.grey))),
                    value: worker_craftSelecteditem,
                    items: worker_craftlist
                        .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        )))
                        .toList(),
                    onChanged: (item) => setState(() {
                      worker_craft = item;

                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(

                  onPressed: ()  async{

                    if(formKey.currentState!.validate()){

                      if (worker_mobileNumber?.length == 11) {
                        await Supabase.instance.client
                            .from('worker')
                            .insert({ 'worker_name': worker_name ,'mobile_number': worker_mobileNumber,  'worker_password': worker_password , 'craft': worker_craft , 'city': worker_city  ,});
                        UserInfo().mobile_number = worker_mobileNumber ;
                        UserInfo().customer_name = worker_name ;
                        UserInfo().customer_address = worker_address;
                        UserInfo().customer_city = worker_city ;
                        UserInfo().customer_password = worker_password;
                        Navigator.pushNamed(context, WorkerHomePage().id);

                      }else{

                        var snackBar =SnackBar(content: Text("Please enter Valid Phone number"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                    }else{

                    }

                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Register as Worker',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' have account press ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'loginpage');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
