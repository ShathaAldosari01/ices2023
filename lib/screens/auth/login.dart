import 'package:flutter/material.dart';

import '../../services/auth.dart';

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

  //function
  Future openDialog()=> showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
          title: const Text("The login failed"),
          content: const Text('could not log in with those credentials.'),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,20,15),
              child: InkWell(
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Color(0xff47bcd0),
                    fontWeight: FontWeight.bold,
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
    return Scaffold(
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
                                  color: Color(0xfff9be39),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
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
                    //welcome
                    const Text(
                      "ICES2023",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36
                      ),
                    ),

                    const SizedBox(height: 10,),

                    const Text(
                      "Sciences for a Bright Future",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    const SizedBox(height: 50,),

                    //email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20 ),
                          child: TextFormField(
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
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20 ),
                          child: TextFormField(
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

                    const SizedBox(height: 10,),

                    //sign in
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24 ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color(0xFF90be56),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child:  Center(
                          child: InkWell(
                            onTap: ()async{
                              if(_formKey.currentState!.validate() ){
                                dynamic result  = await _auth.logInWithEmailAndPassword(email, password);
                                if(result == null){
                                  openDialog();
                                }
                              }
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          child: const Text(
                            "create a new account.",
                            style: TextStyle(
                              color:  Color(0xFF47bcd0),
                              fontWeight: FontWeight.bold,
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
