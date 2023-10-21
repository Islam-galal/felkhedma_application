import 'package:felkhedma_applications/Screens/CarpenterHomeScreen.dart';
import 'package:felkhedma_applications/Screens/ElictricalHomeScreen.dart';
import 'package:felkhedma_applications/Screens/PainterHomeScreen.dart';
import 'package:felkhedma_applications/Screens/PlumberScreen.dart';
import 'package:felkhedma_applications/Screens/Worker_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Screens/HomePage.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WorkerScreen.dart';
import 'Screens/favouritesScreen.dart';
import 'Screens/orders.dart';
import 'Screens/Customer_profile_page.dart';
import 'Screens/requestScreen.dart';
import 'Screens/worker_homepage.dart';

Future<void> main() async{

  await Supabase.initialize(
    url: 'https://pxctszbnznqgfqgetqtt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4Y3RzemJuem5xZ2ZxZ2V0cXR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODY3Njk5ODQsImV4cCI6MjAwMjM0NTk4NH0.DkVJQCeaXN7_xzsOmGAYuXaCkNWpfXmeHsUwDnUKoow',
  );
  final supabase = Supabase.instance.client;

// Get a reference your Supabase client
//   var supabase = Supabase.instance.client;
  runApp( Felkhedma());

}
class Felkhedma extends StatelessWidget {const Felkhedma({super.key});

@override
Widget build(BuildContext context) {

  return MaterialApp(
    routes: {
      LoginScreen().id : (context) => LoginScreen(),
      RegisterScreen().id : (context) => RegisterScreen(),
      WorkerScreen().id : (context) => WorkerScreen(),
      HomePage().id: (context)=> HomePage() ,
      WorkerHomePage().id: (context)=> WorkerHomePage(),
      ProfileScreen().id: (context)=> ProfileScreen(),
      WorkerProfileScreen().id: (context)=> WorkerProfileScreen(),
      OrderScreen().id: (context)=> OrderScreen(),
      FavouritesScreen().id: (context)=> FavouritesScreen(),
      RequestScreen().id : (context)=> RequestScreen(),
      PlumberScreen().id : (context)=> PlumberScreen(),
      CarpenterScreen().id : (context)=> CarpenterScreen(),
      PainterScreen().id : (context)=> PainterScreen(),
      ElictricalScreen().id : (context)=> ElictricalScreen(),
    },
    debugShowCheckedModeBanner: false,
    initialRoute: "loginpage",
  );
}
}