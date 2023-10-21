class CategoryModel{

  final int id;
  final int workerMobileNumber;
  final String workerName;
  final String craft;


  // constractor
  CategoryModel({
    required this.id,
    required this.workerMobileNumber,
    required this.workerName,
    required this.craft,
  });

  //use toGet data from internet

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(
      id: jsonData['id'],
      workerMobileNumber: jsonData['workerMobileNumber'],
      workerName: jsonData['workerName'],
      craft: jsonData['craft'],

    );
  }

}