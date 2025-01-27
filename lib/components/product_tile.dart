import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixthproject/main.dart';
import 'package:sixthproject/models/product.dart';
import 'package:sixthproject/models/shop.dart';


 class MyProductTile extends StatelessWidget {
   final Product product;
   const MyProductTile({
     super.key,
     required this.product
   });

   // add to cart button pressed


   void addToCart(BuildContext context){
    // show a dialog box to ask user to confrim add to cart
     showDialog(context: context, builder: (context) =>
         AlertDialog(
            content: Text('Add this item to your cart?'),
           actions: [
             // cancel button
             MaterialButton(onPressed: () => Navigator.pop(context),
               child: Text('cancel'),),

             // yes button
             MaterialButton(onPressed: (){
               //pop dialog box
               Navigator.pop(context);

               // add to cart
               context.read<Shop>().addToCart(product);

             },
               child: Text('Yes'),),
           ],

     ),);
   }


   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(12),
       ),
       margin: const EdgeInsets.all(10),
       padding: const  EdgeInsets.all(25),
       width: 300,
       child:
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             // product image
             AspectRatio(
               aspectRatio: 1,
               child:
               Container(
                   decoration: BoxDecoration(color: Colors.white,
                     borderRadius: BorderRadius.circular(12),

                   ),

                   width: double.infinity,
                   padding: EdgeInsets.all(25),
                   child: Image.asset(product.imagePath),
               ),
             ),

             const SizedBox(height: 25),
             // product name

             Text(
               product.name,
               style: const TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold ,

               ),),
             const SizedBox(height: 10),

             // product description
             Text(
               product.description,
               style: TextStyle(color: Colors.grey.shade700),
             ),
           ],
         ),

           const SizedBox(height: 25),

           // product price + add to cart button
      Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // product of price
          Text(
             '\$'+ product.price.toStringAsFixed(2)),


           // add to cart button
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
                onPressed: () => addToCart(context),
                icon: const Icon(Icons.add, color: Colors.white,),
            ),
          ),
        ],
      ),
       ],
       ),
     );
   }
 }
