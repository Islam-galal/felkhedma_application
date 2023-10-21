
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/ButtonField.dart';
import '../Widgets/CustomTextFiled.dart';
import 'HomePage.dart';

class RequestScreen extends StatelessWidget {
   RequestScreen({super.key});

  String id = 'requestScreen';

   GlobalKey<FormState> formKey =  GlobalKey();

   String? customer_orderDetails ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Fill Below Details'),
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
                hintText:UserInfo().worker_nameInOrder,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFiled(
             hintText: UserInfo().worker_MobileNumberInOrder,
              ),

              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  maxLines: 5,
                  onChanged: (data){
              customer_orderDetails = data ;
              },
                  decoration: InputDecoration(
                    hintText: 'Add your Request details',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical:150 ),
                  ),),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(

                onPressed: () async {

                  if(formKey.currentState!.validate()){

                    await Supabase.instance.client
                        .from('orders')
                        .insert({'customer_number': UserInfo().mobile_number, 'worker_number': UserInfo().worker_MobileNumberInOrder , 'body': customer_orderDetails , 'status': 'pending' });

                    var snackBar =SnackBar(content: Text('Request created Successfully '));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Navigator.pushNamed(context, HomePage().id);

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
                        'Create Request',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
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