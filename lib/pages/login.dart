import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/signup.dart';
import 'package:shopping_app/widget/support_widget.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogState();
}

class _LogState extends State<LogIn> {
String email="", password="";

  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller= new TextEditingController();
  
  final _formkey= GlobalKey<FormState>();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home())); //home ke jgh BottomNav
    } on FirebaseAuthException catch(e) {
      if(e.code=='user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("No User Found for that Email", style: TextStyle(fontSize:20.0),)));
      }
      else if(e.code=="wrong-password"){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Wrong Password Provided by User", style: TextStyle(fontSize:20.0),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(top:40.0,left:20.0,right:20.0, bottom:40.0),
          child: Form(
            key:_formkey,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
             Image.asset("images/login.png"),
             Center(
               child: Text("Sign In",
               style:AppWidget.semiboldTextFieldStyle(),),
             ),
             const SizedBox(height:20.0,),
             Text("Please enter the details below to continue.",
             style:AppWidget.lightTextFieldStyle(),
             ),
             const SizedBox(height:40.0,),
             Text("Email",
             style:AppWidget.semiboldTextFieldStyle(),
             ),
             const SizedBox(height:20.0,),
             Container(
              padding:const EdgeInsets.only(left:20.0),
              decoration:BoxDecoration(color:Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
              child:TextFormField(
                  validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Please Enter your Email' ;
                  }
                  return null;
                },
                controller: mailcontroller,
                decoration:InputDecoration(border:InputBorder.none, hintText:"Email"),
              ),
              ),
              const SizedBox(height:20.0,),
             Text("Password",
             style:AppWidget.semiboldTextFieldStyle(),
             ),
             const SizedBox(height:20.0,),
             Container(
              padding:const EdgeInsets.only(left:20.0),
              decoration:BoxDecoration(color:Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
              child:TextFormField(
                controller:passwordcontroller,
                  validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Please Enter your Password' ;
                  }
                  return null;
                },
                decoration:InputDecoration(border:InputBorder.none, hintText:"Password"),
              ),
              ),
            const SizedBox(height:20.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text("Forgot Password?", style: TextStyle(color:Colors.green, fontSize:18.0, fontWeight:FontWeight.w500)),
               ],
             ),
             const SizedBox(height:30.0),
             GestureDetector(
              onTap:() {
                if(_formkey.currentState!.validate()) {
                  setState(() {
                    email=mailcontroller.text;
                    password=passwordcontroller.text;
                  });
                }
                userLogin();
              },
               child: Center(
                 child: Container(
                  width:MediaQuery.of(context).size.width/2,
                  padding:const EdgeInsets.all(10),
                  decoration:BoxDecoration(color:Colors.green, borderRadius:BorderRadius.circular(10)),
                  child:const Center(child: Text("LOGIN", style:TextStyle(color:Colors.white, fontSize:10.0, fontWeight:FontWeight.bold)))
                  ),
               ),
             ),
             const SizedBox(height:20.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't have an account? ",style:AppWidget.lightTextFieldStyle()),
                 GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: const Text("Sign Up", style: TextStyle(color:Colors.green, fontSize:18.0, fontWeight:FontWeight.w500))),
               ],
             )
            ],
            ),
          ),
        ),
      ),
    );
  }
}