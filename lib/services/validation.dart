import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/userInfo.dart';

class Validation{


 Future<bool> checkCustomerMobileNumber(String? customerEnteredNumber , String? customerEnteredPassword) async {
   try {
     final response = (await Supabase.instance.client
         .from('users')
         .select('*').match(
         {'mobile_number': customerEnteredNumber! ,'customer_password': customerEnteredPassword})) as List<dynamic>;
     if(response.isEmpty){
       return false;
     }else{
       UserInfo().mobile_number = customerEnteredNumber ;
       UserInfo().customer_name = response[0]['customer_name'] ;
       UserInfo().customer_address = response[0]['customer_address'] ;
       UserInfo().customer_city = response[0]['customer_city'] ;
       UserInfo().customer_password = response[0]['customer_password'] ;

       print(response[0]);

       return true;

     }
   }

   on SocketException catch (e){

     throw SocketException('Network Error Please try again');

   }
   on Exception catch (e) {
     return false;
   }
 }


 Future<bool> checkWorkerMobileNumber(String? customerEnteredNumber , String? customerEnteredPassword) async {
   try {
     final response = (await Supabase.instance.client
         .from('worker')
         .select('*').match(
         {'mobile_number': customerEnteredNumber! ,'worker_password': customerEnteredPassword})) as List<dynamic>;
     if(response.isEmpty){
       return false;
     }else{
       UserInfo().mobile_number = customerEnteredNumber ;
       UserInfo().customer_name = response[0]['worker_name'] ;
       UserInfo().customer_city = response[0]['city'] ;
       UserInfo().customer_password = response[0]['worker_password'] ;

       print(response[0]);

       return true;

     }
   }
   on SocketException catch (e){

     throw SocketException('Network Error Please try again');

   }
   on Exception catch (e) {
     return false;
   }
 }



}