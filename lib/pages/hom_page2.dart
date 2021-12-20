import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'hom_page.dart';
class HomPage2 extends StatefulWidget {
  static const String id="hom_page2";
  const HomPage2({Key? key}) : super(key: key);

  @override
  _HomPage2State createState() => _HomPage2State();
}

class _HomPage2State extends State<HomPage2> {
  final userNamecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  void duLogin(){
    String user=userNamecontroller.toString().trim();
    String email= emailcontroller.toString().trim();
    String phone= phonecontroller.toString().trim();
    String password=passwordcontroller.toString().trim();
    var box=Hive.box('pdp_online');
    box.put('user',user);
    box.put('email',email);
    box.put('phone',phone);
    box.put('password',password);
    String us=box.get('user');
    String em=box.get('email');
    String ph=box.get('phone');
    String pa=box.get('password');

    print(us);
    print(em);
    print(ph);
    print(pa);
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff050d30),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left:20,right: 20,top: 100),
          child: Column(
            children: [
              //#Create
              Text("Create",style: TextStyle(color: Colors.white,fontSize: 30),),
              SizedBox(height: 5,),
              //#Account
              Text("Account",style: TextStyle(color: Colors.white,fontSize:30),),
              SizedBox(height: 40,),
              //#User name
              TextField(
                controller:userNamecontroller,
                decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(height: 10,),
              //#E-Moil
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined,color: Colors.grey,),
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(height: 10,),
              //#Phone Number
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone,color: Colors.grey,),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(height: 10,),
              //#password
              TextField(
                controller:passwordcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key_outlined,color: Colors.grey,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(height:75,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:FlatButton(
                  onPressed: (){
                    duLogin();
                  },
                  child:  Center(
                    child: Icon(Icons.arrow_forward_outlined,color: Colors.white,size:30,),
                  ),
                ),
              ),
              SizedBox(height:90,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alroady have an account?",style: TextStyle(color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                     Navigator.pushReplacementNamed(context,HomPage.id);
                    },
                    child:Text("SIGN UP",style: TextStyle(color: Colors.blue,fontSize:15),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
