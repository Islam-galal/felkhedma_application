import 'package:felkhedma_applications/Screens/Customer_profile_page.dart';
import 'package:felkhedma_applications/Screens/Worker_profile_page.dart';
import 'package:felkhedma_applications/Widgets/ButtonField.dart';
import 'package:felkhedma_applications/Widgets/WorkerCardWidget.dart';
import 'package:felkhedma_applications/Widgets/WorkerOrderCard.dart';
import 'package:felkhedma_applications/Widgets/workerPendingCards.dart';
import 'package:felkhedma_applications/models/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'LoginScreen.dart';
// final supabase = Supabase.instance.client;

class WorkerHomePage extends StatefulWidget {
   WorkerHomePage({Key? key,
  }):super(key: key);

   String id = 'workerHomepage';


  @override
  State<WorkerHomePage> createState() => _WorkerHomePageState();
}




class _WorkerHomePageState extends State<WorkerHomePage> {



  final  _future = Supabase.instance.client.from('orders').select<List<Map<String, dynamic>>>().eq('worker_number', UserInfo().mobile_number).order('id', ascending: false);

  final  _futurePending = Supabase.instance.client.from('orders').select<List<Map<String, dynamic>>>('worker_number , status').eq( UserInfo().mobile_number!, 'pending').order('id', ascending: false);

  @override
  void initState() {
    print(_future);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(' Your Orders list'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  UserInfo().customer_name!,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, WorkerProfileScreen().id);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen().id);
              },
            ),
          ],
        ),

      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              final worker_data = data[index];
              return WorkerPendingCardWidget(customeMobileNumber: worker_data['customer_number'], workerMobileNumber: worker_data['worker_number'], customer_OrderDetails: worker_data['body'], orderId: worker_data['id'],);
            }),
          );
        },
      ),
    );
  }
}
