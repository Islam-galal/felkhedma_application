import 'package:felkhedma_applications/Widgets/WorkerOrderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/WorkerCardWidget.dart';
import '../models/userInfo.dart';
import 'HomePage.dart';

class OrderScreen extends StatefulWidget {
   OrderScreen({super.key});

  String id = 'orderScreen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final  _future = Supabase.instance.client.from('orders').select<List<Map<String, dynamic>>>().eq('customer_number', UserInfo().mobile_number).order('id', ascending: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Your Order History'),
          leading: IconButton(onPressed: (){
            Navigator.pushNamed(context, HomePage().id);
          }, icon: Icon(Icons.arrow_back))

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
              return WorkerOrderCardWidget(id: worker_data['id'], workerMobileNumber: worker_data['worker_number'], orderDetails: worker_data['body'], orderStatus: worker_data['status'],);
            }),
          );
        },
      ),
    );
  }
}
