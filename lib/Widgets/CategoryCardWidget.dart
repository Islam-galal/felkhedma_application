
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCardWidgets extends StatelessWidget {
   CategoryCardWidgets({
   required this.categoryName ,required this.categoryImage

  });

  String categoryName;
  String categoryImage;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
            )
          ]),
          height: 130,
          width: 220,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  categoryImage)),
        ),

      ],
    );
  }
}
