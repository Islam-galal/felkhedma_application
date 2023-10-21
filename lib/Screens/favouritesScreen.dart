
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/WorkerCardWidget.dart';
final supabase = Supabase.instance.client;

class FavouritesScreen extends StatefulWidget {
  FavouritesScreen({super.key});

  String id = 'favouritesScreen';

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final Future<dynamic> _future = supabase.from('worker').select('worker_name').select("*");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Your Favourites Workers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        FutureBuilder(
          future: _future,
          builder: ( context , snapshot) {
            return WorkerCardWidget(

              workerName:  snapshot.data, workerMobileNumber: 0100000000, workerCraft: 'Plamber', workerCity: 'Abdeeeen',
            );
          }
        )
        ],
      ),
    );
  }
}
