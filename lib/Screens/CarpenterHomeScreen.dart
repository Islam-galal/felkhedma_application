import 'package:felkhedma_applications/Screens/Customer_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Widgets/WorkerCardWidget.dart';
import 'HomePage.dart';

class CarpenterScreen extends StatefulWidget {
  CarpenterScreen({super.key});

  String id = 'CarpenterHomepage';

  @override
  State<CarpenterScreen> createState() => _CarpenterScreenState();
}

class _CarpenterScreenState extends State<CarpenterScreen> {

  final  _future = Supabase.instance.client.from('worker').select<List<Map<String, dynamic>>>().eq('craft', 'Carpenter');
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
          title: Text(' Carpenter Home Page'),
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
              return WorkerCardWidget(workerName: worker_data['worker_name'], workerMobileNumber: worker_data['mobile_number'], workerCraft: worker_data['craft'], workerCity: worker_data['city'],);
            }),
          );
        },
      ),
    );
  }
}
