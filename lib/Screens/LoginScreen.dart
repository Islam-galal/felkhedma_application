import 'dart:io';

import 'package:felkhedma_applications/Screens/worker_homepage.dart';
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:felkhedma_applications/services/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';
import 'HomePage.dart';
import 'RegisterScreen.dart';
import 'WorkerScreen.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  String id = "loginpage";

   String? user_mobile , user_password;

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
                SizedBox(height: 10,),
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
                      'Login',
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
                  hintText: 'Enter your Mobile Number',
                    onChanged: (data){
                      user_mobile = data ;
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFiled(
                  obscureText: true,
                  hintText: 'Enter your Password',
                    onChanged: (data){
                      user_password = data ;

                    }
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: ()  async{

                   try {
                     if (formKey.currentState!.validate()) {
                       if (await Validation().checkCustomerMobileNumber(user_mobile , user_password) ) {

                         // UserInfo().mobile_number = user_mobile ;
                         Navigator.pushNamed(context, HomePage().id);


                       }else if(await Validation().checkWorkerMobileNumber(user_mobile , user_password)){

                         Navigator.pushNamed(context, WorkerHomePage().id);

                       }else{

                         var snackBar =SnackBar(content: Text('Please enter valid Number or Password'));
                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       }
                     }


                   }

                   on SocketException catch (e){

                     var snackBar =SnackBar(content: Text("Network error"));
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);

                   }

                   on Exception catch (e) {

                     var snackBar =SnackBar(content: Text(e.toString()));
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                          'Log In',
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
                      'if you don\'t have account press ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RegisterScreen().id);
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or you can register as ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WorkerScreen().id);
                      },
                      child: Text(
                        'Worker',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
