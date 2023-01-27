import 'package:flutter/material.dart';

Widget buildCategory(){
  return Expanded(
    child: GestureDetector(
      onTap: () {
        print("Tap");
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 70,
              width: 90,
              child: Center(
                child: SizedBox(
                  height: 70,
                  width: 80,
                  child: Image.network(
                      "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png"
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Category",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}