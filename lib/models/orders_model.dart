class OrderModel{

  final int id;
  final int customerMobileNumber;
  final int workerMobileNumber;
  final DateTime visitTime;
  final String orderDescription;
  final String status;


  // constractor
  OrderModel({
    required this.id,
    required this.customerMobileNumber,
    required this.workerMobileNumber,
    required this.visitTime,
    required this.orderDescription,
    required this.status,

  });

  //use toGet data from internet

  factory OrderModel.fromJson(jsonData) {
    return OrderModel(
      id: jsonData['id'],
      customerMobileNumber: jsonData['customerMobileNumber'],
      workerMobileNumber: jsonData['workerMobileNumber'],
      visitTime: jsonData['visitTime'],
      orderDescription: jsonData['orderDescription'],
      status: jsonData['status'],

    );
  }

}