import 'package:felkhedma_applications/Screens/LoginScreen.dart';
import 'package:felkhedma_applications/Screens/RegisterScreen.dart';
import 'package:felkhedma_applications/Screens/WorkerScreen.dart';
import 'package:felkhedma_applications/Screens/worker_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class ButtonField extends StatelessWidget {
  ButtonField({
    required this.text,
    required this.screenName,
    required this.pageId,
  });

  String text;
  var screenName;
  var pageId;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()  async{

        if(screenName == RegisterScreen().id){
          await Supabase.instance.client
              .from('users')
              .insert({'mobile_number': 01003850189, 'customer_name': "islam galal" , 'customer_address': 'NasrCity' , 'customer_city': 'Cairo' , 'customer_password': 'passw0rd'});
          Navigator.pushNamed(context, LoginScreen().id);

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
              text,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
    );
  }
}
