import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';

import '../../services/auth.dart';
import '../../shared/loading.dart';

class Login extends StatefulWidget {

  final Function toggleView;

  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  /*Attribute*/
  final AuthService _auth = AuthService();

  //text field state
  String name= '';
  String email ='';
  String password = '';

  //for the form
  final _formKey = GlobalKey<FormState>();

  //for loading
  bool loading = false;

  //function
  Future openDialog()=> showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
          title: const Text(
            "The login failed",
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
          ),
          content: const Text(
            'could not log in with those credentials.',
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,20,15),
              child: InkWell(
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Palette.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            )
          ]
      )
  );

  @override
  Widget build(BuildContext context) {
    return loading?const Loading() :Scaffold(
      backgroundColor: Colors.white,

      //fix overload error
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //skip
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  color: Palette.yellow,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              onTap: () async{
                                dynamic result = await _auth.signInAnon();

                                if(result == null ){
                                  print("error signin in");
                                }else{
                                  print("Signed in");
                                  print(result);
                                }
                              },
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),

              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child:Image.asset('assets/logo.png'),
                    ),

                    //email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Palette.white),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20 ),
                          child: TextFormField(
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email"
                            ),

                            //validation
                            validator: (emailValue){
                              return emailValue!.isEmpty?"Enter your email.":null;
                            },

                            //action
                            onChanged: (emailValue){
                              setState(() {
                                email = emailValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    //pass
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Palette.white),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20 ),
                          child: TextFormField(
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                            ),
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password"
                            ),
                            //validation
                            validator: (passValue){
                              return passValue!.length<8?"The password should be at least 8 characters long.":null;
                            },

                            //action
                            onChanged: (passValue){
                              password = passValue;
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25,),

                    //sign in
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25 ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Palette.green,
                        ),
                        child:  Center(
                          child: InkWell(
                            onTap: ()async{
                              setState(() {
                                loading = true;
                              });
                              if(_formKey.currentState!.validate() ){
                                dynamic result  = await _auth.logInWithEmailAndPassword(email, password);
                                if(result == null){
                                  openDialog();
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25,),

                    //register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        InkWell(
                          child: const Text(
                            "create a new account.",
                            style: TextStyle(
                              color:  Palette.blue,
                              fontFamily: 'OpenSans',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: (){
                            widget.toggleView();
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
