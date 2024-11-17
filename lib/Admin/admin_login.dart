import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Admin/home_admin.dart';
import 'package:shopping_app/widget/support_widget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState()=> _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller= new TextEditingController();
  TextEditingController userpasswordcontroller= new TextEditingController();
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(top:40.0,left:20.0,right:20.0, bottom:40.0),
          child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
             Image.asset("images/login.png"),
             Center(
               child: Text("Admin Panel",
               style:AppWidget.semiboldTextFieldStyle(),),
             ),
             const SizedBox(height:20.0,),
             Text("Username",
             style:AppWidget.semiboldTextFieldStyle(),
             ),
             const SizedBox(height:20.0,),
             Container(
              padding:const EdgeInsets.only(left:20.0),
              decoration:BoxDecoration(color:Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
              child:TextFormField(
                controller: usernamecontroller,
                decoration:const InputDecoration(border:InputBorder.none, hintText:"Username"),
              ),
              ),
             const SizedBox(height:20.0,),
              const SizedBox(height:20.0,),
             Text("Password",
             style:AppWidget.semiboldTextFieldStyle(),
             ),
             const SizedBox(height:20.0,),
             Container(
              padding:const EdgeInsets.only(left:20.0),
              decoration:BoxDecoration(color:Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
              child:TextFormField(
                obscureText: true,
                controller: userpasswordcontroller,
                decoration:InputDecoration(border:InputBorder.none, hintText:"Password"),
              ),
              ),
             const SizedBox(height:30.0),
             GestureDetector(
              onTap:() {
                loginAdmin();
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
            ],
            ),
          ),
        ),
    );
  }

  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result) {
        if(result.data()['username']!=usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Your id is not correct", style: TextStyle(fontSize:20.0),
          )));
        }
        else if(result.data()['password']!=userpasswordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Your password is not correct", style: TextStyle(fontSize:20.0),
          )));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
        }
        }
      );
    });
  }
}

