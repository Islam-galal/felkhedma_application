import 'package:felkhedma_applications/Widgets/CustomerFormTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';
import '../models/userInfo.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  String id = "registerScreenForCustomers";


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final myController = TextEditingController();

  List<String> itemList = [

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
    'Bani Swaf' ,
    'Cairo ',

  ];
  String? selectedItem = 'Cairo ';
  double sizeBoxHeight = 5 ;
  String? mobile_number ,customer_name , customer_address , customer_city = 'Cairo' , customer_password ;



 GlobalKey<FormState> formKey =  GlobalKey();

  @override
  Widget build(BuildContext context) {
    int customer_mobile;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
              Image.asset('images/app_logo.png' , height: 200,),
                SizedBox(
                  height: sizeBoxHeight,
                ),
                Center(
                  child: Text(
                    "Felkhedma Servcies ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
                Row(
                  children: [
                    Text(
                      'Register Here',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
               CustomTextFiled(
                 text: TextInputType.number,
                 hintText: 'Enter your Mobile number',
                 onChanged: (data){
                   mobile_number = data ;

                 },),
                 SizedBox(
                   height: sizeBoxHeight,
                 ),
                 CustomTextFiled(
                   hintText: 'Enter your Name',
                   onChanged: (data){
                     customer_name = data ;
                   },
               ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
                CustomTextFiled(
                  hintText: 'Enter your Address',
                  onChanged: (data){
                    customer_address = data ;
                  },
                ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey))),
                    value: selectedItem,
                    items: itemList
                        .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                             customer_city = item,
                              style: TextStyle(fontSize: 16),
                            )))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectedItem = item;
                    }),
                  ),
                ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
                CustomTextFiled(
                  hintText: 'Enter your Password',
                  obscureText: true,
                  onChanged: (data){
                    customer_password = data ;
                  },

                ),
                SizedBox(
                  height: sizeBoxHeight,
                ),
              TextButton(

                onPressed: ()  async{

                  if(formKey.currentState!.validate()){

                    if(mobile_number?.length == 11)
                      {
                        await Supabase.instance.client
                            .from('users')
                            .insert({'mobile_number': mobile_number, 'customer_name': customer_name , 'customer_address': customer_address , 'customer_city': customer_city , 'customer_password': customer_password});

                        UserInfo().mobile_number = mobile_number ;
                        UserInfo().customer_name = customer_name ;
                        UserInfo().customer_address = customer_address;
                        UserInfo().customer_city = customer_city ;
                        UserInfo().customer_password = customer_password ;

                        Navigator.pushNamed(context, HomePage().id);
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
                        'Register',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
              ),

                SizedBox(
                  height: sizeBoxHeight,
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

                        Navigator.pushNamed(context, LoginScreen().id);
                      },
                      child: Text(
                        'LogIn',
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
