import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget{
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 235, 231),
      body:Container(
        margin:const EdgeInsets.only(top:50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Image.asset('images/headphone.PNG'),      //to call the images: pubspec.yaml -> assets -> uncomment it & 1st line change to -images/
        const Padding(
          padding:  EdgeInsets.only(left:12.0,top:20.0),
          child:  Text('Explore\nThe Best\nProducts',
          style:TextStyle(
            color: Colors.black,
            fontSize:40.0,
            fontWeight:FontWeight.bold
               ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(right:10,top:10),
              decoration: const BoxDecoration(color:Colors.black,
              shape: BoxShape.circle,
              ),
              child: const Text('Next',
              style:TextStyle(
            color: Colors.white,
            fontSize:30.0,
            //fontWeight:FontWeight.bold,
              ),
             ),
            ),    
           ],
          ),
         ],
        ),
      ),
    );
  }
}