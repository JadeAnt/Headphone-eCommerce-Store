import 'package:flutter/material.dart';

import 'productCard.dart';


//List items will be added over time
List <Widget> shoppingCartListing =  []; 

class ShoppingCartApp extends StatefulWidget{
  ShoppingCart createState() => new ShoppingCart();
  ShoppingCartApp ({Key key}) : super(key: key);
  
}

class ShoppingCart extends State<ShoppingCartApp>{


  Widget topAppBar (){ 
    return AppBar(
      centerTitle: true,
      title: const Text('Shopping Cart', style: TextStyle(color: Colors.white, fontSize: 25)),
      backgroundColor: Colors.blueGrey[800],
      //automaticallyImplyLeading: false,
     
    );
  }

  Widget _totalPrice(){
    double total = 0;
    

    for(var i = 0; i < shoppingCartListing.length; i++){
      ProductCard myprod = shoppingCartListing[i];
      total +=  myprod.currentPrice;
    }
    
    return Container( 
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      color: Colors.amber,
      child:Text(
        'Total Price: \$$total',
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _productGridView(){
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: shoppingCartListing.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){return Container(child: shoppingCartListing[index],);},
          ),
        ),
      );
    }

  Widget _checkoutButton(){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.amber,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Checkout",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: topAppBar(),
      body: Container(
        child: Stack( 
          children: <Widget> [
            _totalPrice(),

            _productGridView(),

          Padding(padding: EdgeInsets.only(top: 500), child:_checkoutButton(), ),
            
          ],
        ),
      ),
    );
  }

}

