
import 'package:flutter/material.dart';
import 'package:loginform/src/AppColors/colors.dart';
import 'package:loginform/src/pages/home_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
// var pswd;
// var email;
Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Email',
        style: TextStyle(
            color: AppTheme.colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox( height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              )
            ]
        ),
        height: 60,
        child: const TextField(

         // key: email,
          keyboardType: TextInputType.emailAddress,
          style:  TextStyle(
              color: Colors.black87
          ),
          decoration:  InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff5ac18e),
              ),
              hintText: 'email',
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      )
    ],
  );
}
Widget buildPassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'password',
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox( height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              )
            ]
        ),
        height: 60,
        child: const TextField(
        //  key: pswd,
          obscureText: true,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration:  InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff5ac18e),
              ),
              hintText: 'password',
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      )
    ],
  );
}
Widget buildButton(context){
  return Container(
    height: 100,
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white
      ),

      onPressed: (){

      // if(emil!=null&& pswd!=null){
        Navigator.pushReplacement(
             context,
            MaterialPageRoute(builder: (context){
              return const HomeScreen();}),
          );

      /*  }
        else{
          print("Enter valid email and password ");
        }*/

      },

      child:const  Text(
        "Login",
        style: TextStyle(
          color: Color(0xff5ac18e),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.white70,
       body: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.colors.loginpage,
                    AppTheme.colors.loginpage1,
                          AppTheme.colors.loginpage2,
                    AppTheme.colors.loginpage3,
                    AppTheme.colors.loginpage4,
                    AppTheme.colors.loginpage5,

                  ]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: AppTheme.colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
               const  SizedBox(height: 50,),
                buildEmail(),
                const SizedBox(height: 20,),
                buildPassword(),
                const SizedBox(height: 25,),
                buildButton(context)
              ],
            ),
          ),
        )

    );
  }
}
