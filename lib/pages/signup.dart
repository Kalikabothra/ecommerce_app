import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:shopping_app/services/database.dart';
import 'package:shopping_app/services/shared_pref.dart';
import 'package:shopping_app/widget/support_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State <SignUp> createState() =>SignUpState();
}

class  SignUpState extends State <SignUp> {
  String? name, email, password;
  TextEditingController namecontroller= new TextEditingController();
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller= new TextEditingController();
  
  final _formkey= GlobalKey<FormState>();

  registration()async{
    if(password!=null && name!=null && email!=null){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email!, password:password!);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Registered Successfully", style: TextStyle(fontSize:20.0),)));
          String Id=randomAlphaNumeric(10);
          await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
          await SharedPreferenceHelper().saveUserId(Id);
          await SharedPreferenceHelper().saveUserEmail(namecontroller.text);
          //await SharedPreferenceHelper().saveUserEmail("link?");
          Map<String, dynamic> userInfoMap={
            "Name": namecontroller.text,
            "Email": mailcontroller.text,
            "Id": Id,
          // "Image":
          //     "link?" 02.40.12
          };
          await DatabaseMethods().addUserDetails(userInfoMap, Id);
          //uncomment after writing bottomnav part
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
      } on FirebaseException catch(e){
        if(e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Password Provided is too weak", style: TextStyle(fontSize:20.0),)));
        }
        else if(e.code=="email-already-in-use"){
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor:Colors.redAccent,
          content:Text("Account already Exists", style: TextStyle(fontSize:20.0),)));

        }
      }
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(top:40.0,left:20.0,right:20.0, bottom:40.0),
          child:Form(
            key:_formkey,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
             Image.asset("images/login.png"),
             Center(
               child: Text("Sign Up",
               style:AppWidget.semiboldTextFieldStyle(),),
             ),
             const SizedBox(height:20.0,),
             Text("Please enter the details below to continue.",
             style:AppWidget.lightTextFieldStyle(),
             ),
             const SizedBox(height:40.0,),
             Text("Name",
             style:AppWidget.semiboldTextFieldStyle(),
             ),
             const SizedBox(height:20.0,),
             Container(
              padding:const EdgeInsets.only(left:20.0),
              decoration:BoxDecoration(color:Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
              child:TextFormField(
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Please Enter your Name' ;
                  }
                  return null;
                },
                controller: namecontroller,
                decoration:const InputDecoration(border:InputBorder.none, hintText:"Name"),
              ),
              ),
             const SizedBox(height:20.0,),
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
                obscureText: true,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Please Enter your Name' ;
                  }
                  return null;
                },
                controller: passwordcontroller,
                decoration:InputDecoration(border:InputBorder.none, hintText:"Password"),
              ),
              ),
             const SizedBox(height:30.0),
             GestureDetector(
              onTap:() {
                if(_formkey.currentState!.validate()){
                  setState(() {
                    name=namecontroller.text;
                    email=mailcontroller.text;
                    password=passwordcontroller.text;
                  });
                }
                registration();
              },

               child: Center(
                 child: Container(
                  width:MediaQuery.of(context).size.width/2,
                  padding:const EdgeInsets.all(10),
                  decoration:BoxDecoration(color:Colors.green, borderRadius:BorderRadius.circular(10)),
                  child:const Center(child: Text("SIGN UP", style:TextStyle(color:Colors.white, fontSize:10.0, fontWeight:FontWeight.bold)))
                  ),
               ),
             ),
             const SizedBox(height:20.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Already have an account? ",style:AppWidget.lightTextFieldStyle()),
                 GestureDetector(
                   onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                   }
                 ),
                 const Text("Sign In", style: TextStyle(color:Colors.green, fontSize:18.0, fontWeight:FontWeight.w500)),
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