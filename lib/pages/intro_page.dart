import 'package:flutter/material.dart';
import 'package:sixthproject/components/my_button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //logo
         Icon(Icons.shopping_bag,
         size: 72,
         color: Colors.grey,
         ),

         const SizedBox(height: 25),

            //title
        const Text('Mensah Mall' , style: TextStyle(
             fontSize: 20,
            fontWeight: FontWeight.bold,
         ),
         ),

            const SizedBox(height: 10),

            //subtititle
         Text('Premium Quality Products', style: TextStyle(
           color: Colors.grey.shade700,
         ),
         ),
            const SizedBox(height: 25),

            //button
           MyButton(
               onTap: () => Navigator.pushNamed(context, '/shop_page'),
               child: const Icon(Icons.arrow_forward),
           )







          ],
        ),
      ),
    );
  }
}
