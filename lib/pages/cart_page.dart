import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixthproject/components/my_button.dart';
import 'package:sixthproject/components/product_tile.dart';
import 'package:sixthproject/models/product.dart';
import 'package:sixthproject/models/shop.dart';

 class CartPage extends StatelessWidget {
   const CartPage({super.key});

    // remove item fromm cart method
    void removeItemFromCart(BuildContext context, Product product){
      // show a dialog box to ask user to confirm to remove item  from cart
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            content: const Text('Remove item from your cart?'),
            actions: [
              // cancel button
              MaterialButton(onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),),

              // yes button
              MaterialButton(onPressed: (){
                //pop dialog box
                Navigator.pop(context);
                // remove from  cart
                context.read<Shop>().removeFromCart(product);
              },
                child: Text('Yes'),),
            ],
          ),);
    }
     // user pressed pay button
    void payButtonPressed( BuildContext context){
      showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('User wants to pay! Connect this app to your payment backend'),
      ),);

    }


   @override
   Widget build(BuildContext context) {
     // get acccess to cart
     final cart = context.watch<Shop>().cart;
     return Scaffold(
         appBar: AppBar(
         title: const Text("Cart Page"),
            centerTitle: true,
           foregroundColor: Colors.grey.shade700,
           elevation: 0,
     ),
          body: Column(
            children: [
              // cart list
              Expanded(
                  child: cart.isEmpty
                      ? const Center(child: const Text('Your cart is empty...'))
                      : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder:  (context, index){
                    //get individual item in cart
                     final item = cart[index];

                    // return as a cart ui
                    return ListTile(
                      title:  Text(item.name),
                      subtitle:  Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton( icon: const Icon(Icons.remove),
                      onPressed: () => removeItemFromCart(context,item),
                      ),
                    );
                  },),
              ),
              //pay button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                    onTap: () => payButtonPressed(context), child: Text('PAY NOW')),
              )
            ],
          ),
     );
   }
 }
