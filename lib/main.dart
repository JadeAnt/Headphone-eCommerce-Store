import 'package:flutter/material.dart';
import 'productCard.dart';
import 'login_page.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'shopping_cart.dart';

void main() => runApp(
  MaterialApp(
    //home:LoginPage(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/landing': (context) => MyApp(),
      '/shopping_Cart': (context) =>  ShoppingCartApp(),
    }
  )
);

class MyApp extends StatefulWidget {
  @override
   _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Widget _topAppBar (){ 
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      //title: const Text('ClotheMe', style: TextStyle(color: Colors.white, fontSize: 25)),
      backgroundColor: Colors.blueGrey[800],
      //automaticallyImplyLeading: false,
      actions: <Widget>[
        //Shopping Cart Page
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: (){
            Navigator.pushNamed(context, '/shopping_Cart');
          },
        ),
        
        //Favorites Page
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.white),
          onPressed: (){},
        ),
      ],
      
    );
  }

  Widget _drawerView(){
    return Drawer(
        child:ListView(
          
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey[800]),
            ),
            ListTile(
              title: Text("Account"),
              trailing: Icon(Icons.account_circle),
              onTap:(){},
            ),

            ListTile(
              title: Text("Orders"),
              trailing: Icon(Icons.local_shipping),
              onTap:(){},
            ),

            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
              onTap:(){},
              
            ),

            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap:(){Navigator.pushNamed(context, '/');},
            ),
          ],
        ),
        
      );
  }

  productListing(){
    return [
      ProductCard("Audeze Headphones", 49.99, 99.99, 50,"assets/Audeze_headphones.png"),
      ProductCard("Bose Headphones", 39.99, 79.99, 50,"assets/Bose_headphones.png"),
      ProductCard("MPOW", 15.99, 29.99, 50,"assets/MPOW_headphone.jpg"),
      ProductCard("Noise Cancelling", 19.99, 39.99, 50,"assets/noise_cancel_headphones.png"),
      ProductCard("QuietComfort", 19.99, 39.99, 50,"assets/QuietComfort_headphones.png"),
      ProductCard("SRH840", 19.99, 39.99, 50,"assets/SRH840_headphones.png"),
   
    ];
  }

  Widget _productGridView(){
    return Container(
      margin: EdgeInsets.only(top: 320),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          children: productListing(),
        ),
      ),
    );

  }

   Widget _carouselView(){
    return Container(
      margin: EdgeInsets.fromLTRB(25, 50, 25, 0),
      height: 200,
      width: 500,
      child: Carousel(
        //NEED WIDER IMAGES FOR CAROUSEL
        images: [
          Image.asset("assets/HeadMe Tech.png"),
          Image.asset("assets/NewArrivals.png"),
        ],
        borderRadius: true,
        boxFit: BoxFit.fitWidth,
      ),
    );
  }

   Widget _newArrivalsText(){
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.amber,),
      child: Text("New Arrivals", style: TextStyle(fontSize: 30, color: Colors.white),),
    );
  }

   Widget _featuredProductsText(){
    return Container(
      child: Column(
        children:<Widget>[
          SizedBox(height: 270), 
          Container(
            color: Colors.amber,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.amber,),
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text("Featured Products", style: TextStyle(fontSize: 30, color: Colors.white),),

          ),
          
        ], 
          
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blueGrey[800],

      appBar: _topAppBar(),

      drawer: _drawerView(),

      body:Stack( 
        children: <Widget>[          
          _newArrivalsText(),
          
          _carouselView(),

          _featuredProductsText(),

          _productGridView(),

          
        ],
     
      ),
 
    );

  }
}
