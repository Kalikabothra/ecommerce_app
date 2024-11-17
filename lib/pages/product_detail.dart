import 'package:flutter/material.dart';
import 'package:shopping_app/widget/support_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState()=>_ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color(0xFFfef5f1),
      body: Container(
        margin:EdgeInsets.only(left:20.0),
        padding:EdgeInsets.only(top:50.0, left: 20.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Stack(
              children: [GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding:EdgeInsets.all(10),
                  decoration:BoxDecoration(border:Border.all(), borderRadius:BorderRadius.circular(30)),
                  child:Icon(Icons.arrow_back_ios_new_outlined)
                ),
              ),
              Center(child: Image.asset("images/headphone2.png",height:400,))
          ],),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top:20.0, left:20.0,right:20.0),
              decoration:const BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))
            ),
            width:MediaQuery.of(context).size.width, child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                Text("Headphone", style:AppWidget.boldTextFieldStyle(),),
                const Text("\$300",
             style: 
             TextStyle(color:Color(0xFFfd6f3e),
             fontSize:23.0,
             fontWeight:FontWeight.bold))
              ],
            ),
            const SizedBox(height:20.0,),
            Text("Details", style:AppWidget.semiboldTextFieldStyle(),),
            const SizedBox(height:10.0,),
            const Text("Experience immersive sound with our premium headphones, designed for crystal-clear audio and all-day comfort. With noise-cancellation technology, deep bass, and up to 30 hours of battery life, these headphones elevate every note. Perfect for music lovers and professionals alike."),
            const SizedBox(height:90.0,),
            Container(
              padding:const EdgeInsets.symmetric(vertical:10.0),
            decoration:BoxDecoration(color:const Color(0xFFfd6f3e), borderRadius:BorderRadius.circular(10)),
            width:MediaQuery.of(context).size.width,
            child:const Center(
              child:Text("Buy Now", style:TextStyle(color:Colors.white, fontSize:20.0, fontWeight: FontWeight.bold) 
              ),
            )
            )
            ],
            ),
          ),
          )
      ],
      ),
      ),
    );
  }
}