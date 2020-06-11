import 'package:flutter/material.dart';
import 'productCard.dart';
import 'dart:ui';
import 'main.dart';
import 'shopping_cart.dart';

class ProductPage extends StatelessWidget{
    String title;
    double currentPrice;
    double discountPrice;
    int discount;
    String imgPath;


    ProductPage(
      this.title,
      this.currentPrice,
      this.discountPrice,
      this.discount,
      this.imgPath,
    );
  

  @override
  Widget build(BuildContext context){

    addItem(){
      ProductCard newProduct = new ProductCard(title,
          currentPrice,
          discountPrice,
          discount,
          imgPath,);

      //_key.currentState.shoppingCartListing.add(newProduct);
      
      if(shoppingCartListing.contains(newProduct))
          return;
        else
          shoppingCartListing.add(newProduct);
      
    }

      Widget appBarView(){
        return AppBar(
          title: Text(title),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],

        );
      }


      Widget add_to_cart_Button() { 
        return Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.amber,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: addItem(),
            child: Text("Add to Cart",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
      }

      return Scaffold(

          appBar: appBarView(),

          body: Center(
            child: Container(
              //color: Colors.blueGrey[800],
              child: Column(
                children: <Widget>[
                  Image.asset(
                    imgPath,
                    height: 400,
                    width: 300,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30.0, 
                      color: Colors.grey
                    ),
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
                        style: TextStyle(
                          fontSize: 30.0, 
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "\$$discountPrice",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "$discount\% off",
                        style: TextStyle(
                          fontSize: 15.0, 
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),

                  SizedBox(height: 25,),

                  add_to_cart_Button(),
                  
                ],
              ),

            ),
          ),




      );
    }
}