import 'package:flutter/material.dart';
import 'package:ices2023/config/palette.dart';
import 'package:ices2023/services/auth.dart';
import 'package:ices2023/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  /*Attribute*/
  final AuthService _auth = AuthService();

  //text field state
  String name= '';
  String email ='';
  String password = '';

  //error msg
  String error = '';

  //loading
  bool loading = false;

  //for the form
  final _formKey = GlobalKey<FormState>();

  //function
  Future openDialog()=> showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
          title: const Text(
            "The Registration failed",
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
          ),
          content: const Text(
            'Please supply a valid email.',
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
                    fontFamily: 'OpenSans',
                    color: Palette.blue,
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
    return loading? const Loading():
    Scaffold(
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
                                  fontFamily: 'OpenSans',
                                  color: Palette.yellow,
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

                    //logo
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child:Image.asset('assets/logo.png'),
                    ),


                    //name
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
                                hintText: "Full name"
                            ),

                            //validation
                            validator: (nameValue){
                              return nameValue!.isEmpty?"Enter your name.":null;
                            },

                            //action
                            onChanged: (nameValue){
                              setState(() {
                                name = nameValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

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
                        child: Center(
                          child: InkWell(
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Palette.black,
                              ),
                            ),
                            onTap: ()async{
                              //create a new account
                              if(_formKey.currentState!.validate() ){
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth.registerWithEmailAndPassword(name, email, password);
                                if(result == null){
                                  setState(() {
                                    error = 'Please supply a valid email.';
                                    loading = true;
                                  });
                                  openDialog();
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25,),

                    //register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            widget.toggleView();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color:  Palette.blue,
                              fontFamily: 'OpenSans',
                              decoration: TextDecoration.underline,
                            ),
                          ),
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
