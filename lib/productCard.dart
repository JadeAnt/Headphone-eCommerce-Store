import 'dart:ui';
import 'shopping_cart.dart';
import 'package:flutter/material.dart';
import 'productPage.dart';

class ProductCard extends StatelessWidget{
  String title;
  double currentPrice;
  double discountPrice;
  int discount;
  String imgPath;

  ProductCard(
    this.title,
    this.currentPrice,
    this.discountPrice,
    this.discount,
    this.imgPath,
  );

  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(
          title,
          currentPrice,
          discountPrice,
          discount,
          imgPath,
        )));
      },
      
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                imgPath,
              ),
              height: 130.0, /*Edit this as needed*/ 
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\$$currentPrice",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "\$$discountPrice",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "$discount\% off",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

}