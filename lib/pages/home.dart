import 'package:flutter/material.dart';
import 'package:shopping_app/widget/support_widget.dart';

class Home extends StatefulWidget{
 const Home({super.key});
 
 @override
 State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  List categories=[
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png",
  ];
  @override
    Widget build (BuildContext context) {
     return Scaffold(
      backgroundColor:const Color(0xfff2f2f2),
      body: Container(
        margin:const EdgeInsets.only(top:45.0,left:20.0,right:20.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Hey, Kalika",
            style:AppWidget.boldTextFieldStyle(),
             ),
             Text("It's great to have you back!",
             style: AppWidget.lightTextFieldStyle(),
             ),
            ],
            ),
            ClipRRect(   //??
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("images/boy.jpg",height:70, width:70, fit:BoxFit.cover,)),
             ],
            ),
            const SizedBox(height:30.0),
            Container(
  decoration:const BoxDecoration(color:Colors.white),
  width:MediaQuery.of(context).size.width,  //??
  child: TextField(
    decoration: InputDecoration(border: InputBorder.none,
    hintText:"Search Products",
    hintStyle:AppWidget.lightTextFieldStyle(),
    prefixIcon: const Icon(Icons.search, color:Colors.black54)
    ),
  )
),
          const SizedBox(height:20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
             Text("Categories",
             style: AppWidget.semiboldTextFieldStyle(),
            ),
            const Text("see all",
             style: 
             TextStyle(color:Color(0xFFfd6f3e),
             fontSize:18.0,
             fontWeight:FontWeight.bold)
            ),
            ],
          ),
          const SizedBox(height:20.0),
          Row(
            children: [
               Container(
                height:130,
      padding:const EdgeInsets.all(20),
      margin: const EdgeInsets.only(right:20.0),
      decoration: BoxDecoration(
        color:const Color(0xFFFD6F3E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text("All",style:TextStyle(color:Colors.white, fontSize:20.0, fontWeight: FontWeight.bold)))
    ),
              Expanded(child:Container(
               height:130,
               child:ListView.builder(
                padding:EdgeInsets.zero,
                itemCount: categories.length,
                shrinkWrap: true,  //??
                scrollDirection:Axis.horizontal,  //??
                itemBuilder:(context,index)
                {
                  return CategoryTile(image: categories[index]);
                }
                ),
              ),
              ),
            ],
          ),          
          SizedBox(height:20.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
             Text("All Products",
             style: AppWidget.semiboldTextFieldStyle(),
            ),
            const Text("see all",
             style: 
             TextStyle(color:Color(0xFFfd6f3e),
             fontSize:18.0,
             fontWeight:FontWeight.bold)
            ),
            ],
            ),
          const SizedBox(height:20.0),
          Container(
            height:240,
            child: ListView(
              shrinkWrap:true,
              scrollDirection:Axis.horizontal,
              children:[
              Container(
                margin:const EdgeInsets.only(right:25.0),
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10)),
                child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                Image.asset("images/headphone2.png",height:150, width:150, fit:BoxFit.cover),
                Text("Headphone", style: AppWidget.semiboldTextFieldStyle(),),
                const SizedBox(height:10.0),
                Row(
                  children:[
                  const Text("\$100",style:TextStyle(color:Color(0xFFfd6f3e),fontSize:22.0,fontWeight:FontWeight.bold)),
                  const SizedBox(width:50.0),
                  Container(
                    padding:const EdgeInsets.all(5),
                    decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                    child: const Icon(Icons.add,color:Colors.white),
                      ),
                     ],)
                    ],
                  ),
                ),
                Container(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                margin:const EdgeInsets.only(right:25.0),
                decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10)),
                child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                Image.asset("images/watch2.png",height:150, width:150, fit:BoxFit.cover),
                Text(" Apple Watch", style: AppWidget.semiboldTextFieldStyle(),),
                const SizedBox(height:10.0),
                Row(
                  children:[
                  const Text("\$300",style:TextStyle(color:Color(0xFFfd6f3e),fontSize:22.0,fontWeight:FontWeight.bold)),
                  const SizedBox(width:50.0),
                  Container(
                    padding:const EdgeInsets.all(5),
                    decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                    child: const Icon(Icons.add,color:Colors.white),
                      ),
                     ],)
                    ],
                  ),
                ),
                Container(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10)),
                child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                Image.asset("images/laptop2.png",height:150, width:150, fit:BoxFit.cover),
                Text(" Laptop ", style: AppWidget.semiboldTextFieldStyle(),),
                const SizedBox(height:10.0),
                Row(
                  children:[
                  const Text("\$1000",style:TextStyle(color:Color(0xFFfd6f3e),fontSize:22.0,fontWeight:FontWeight.bold)),
                  const SizedBox(width:50.0),
                  Container(
                    padding:const EdgeInsets.all(5),
                    decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                    child: const Icon(Icons.add,color:Colors.white),
                      ),
                     ],)
                    ],
                  ),
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

class CategoryTile extends StatelessWidget {
  String image;
  CategoryTile({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      margin: const EdgeInsets.only(right:20.0),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Image.asset(image, height:50, width:50, fit:BoxFit.cover),
        const Icon(Icons.arrow_forward)
       ],
      ),
    );
  }
}