import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixthproject/components/my_list_tile.dart';
import 'package:sixthproject/components/product_tile.dart';
import 'package:sixthproject/main.dart';
import 'package:sixthproject/models/shop.dart';
  

 class ShopPage extends StatelessWidget {
   const ShopPage({super.key});
 
   @override
   Widget build(BuildContext context) {

     // access produts in shop
     final products = context.watch<Shop>().shop;


     return  Scaffold(
       appBar: AppBar(
         title: const Text("Shop Page"),
         centerTitle: true,
         backgroundColor: Colors.transparent,
         foregroundColor: Colors.grey.shade700,
         elevation: 0,
         actions: [
           // go to cart button
           IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'), icon: const Icon(Icons.shopping_cart_outlined))
         ],
       ),

        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               children: [
                 // drawer head
                 DrawerHeader(
                   child:
                   Center(
                     child: Icon(Icons.shopping_bag,
                       size: 72,
                       color: Colors.grey[800],
                     ),
                   ),
                 ),
                 const SizedBox(height: 25),

                 //shop tile
                 MyListTile(
                   text: 'Shop',
                   icon: Icons.home,
                   onTap: () => Navigator.pop(context),
                 ),


                 // cart tile

                 MyListTile(
                   text: 'Cart',
                   icon: Icons.shopping_cart,
                   onTap: (){
                     //pop drawer first
                     Navigator.pop(context);

                     // go to cart page
                     Navigator.pushNamed(context, '/cart_page');
                   },
                 ),
               ],
             ),

              //exit shop tile
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyListTile(
                  text: 'Exit',
                  icon: Icons.logout,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
             const SizedBox(height: 25),

            //shop subtitle
            Center(
                child: Text('Pick from selected list of premium products',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
            ),


            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){

                  // get each individual product from shop
                  final product = products[index];
                  // return as a product tile ui
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        )
     );
   }
 }
 