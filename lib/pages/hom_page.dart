
import 'package:dadademo/pages/hom_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class HomPage extends StatefulWidget {
  static const String id="hom_page";
  const HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  final userNamecontroler=TextEditingController();
  final passwordcontroler=TextEditingController();
  

 void  doLogin(){
   String userName=userNamecontroler.toString().trim();
   String password=passwordcontroler.toString().trim();
   var box=Hive.box('pdp_online');
   box.put('userName',userName);
   box.put('password',password);
   String us=box.get('userName');
   String ps=box.get('password');
   print(us);
   print(ps);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff050d30),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left:20,right: 20,top: 100),
          child: Column(
            children: [
              //#Image
              Container(
                margin: EdgeInsets.symmetric(horizontal: 155,),
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/ranaldo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //#Welcome
              Text("Welcome Back!",style: TextStyle(color: Colors.white,fontSize: 30),),
              SizedBox(height: 5,),
              //#Sigin
              Text("Sign in to continuo",style: TextStyle(color: Colors.white,fontSize:18),),
              SizedBox(height: 40,),
              //#User name
              TextField(
                controller: userNamecontroler ,
                decoration: InputDecoration(
                  fillColor: Colors.white,
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
              //#password
              TextField(
                controller: passwordcontroler,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key_outlined,color: Colors.grey,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(height:25,),
              Text("Forgot Password?",style: TextStyle(color: Colors.grey,fontSize: 15),),
              SizedBox(height:50,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:FlatButton(
                  onPressed:(){
                    doLogin();
                  },
                  child:  Center(
                    child: Icon(Icons.arrow_forward_outlined,color: Colors.white,size:30,),
                  ),
                ),
              ),
              SizedBox(height:100,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                     Navigator.pushReplacementNamed(context, HomPage2.id);
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
