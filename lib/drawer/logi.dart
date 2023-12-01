import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final loginkey = GlobalKey<FormState>();
  bool pass = false;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Form(
        key: loginkey,
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img2.png'))),
            height: size.height,
            width: size.width,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 290),
                child: Container(
                  width: 350,
                  height: 280,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 20, color: Colors.black38)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 30)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 19, right: 19),
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your email';
                                }
                                if (!RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(value)) {
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter your emial')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text('Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 19, right: 19),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !pass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      pass = !pass;
                                    });
                                  },
                                  icon: Icon(pass
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: 'enter your password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please confirm your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //       builder: (context) => Forgott(),), (
                          //     route) => false);
                        }, child: Text('Forgot password')),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(100, 40)),
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          loginkey.currentState!.validate();
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePages(),));
                        },
                        child: Text('login')),
                  ],
                ),
              ), Padding(
                padding: const EdgeInsets.all(30),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account?'),
                    TextButton(onPressed: () {
                      // Navigator.pushAndRemoveUntil(context,
                      //     MaterialPageRoute(builder: (context) => const RE(),), (
                      //         route) => false);
                    }, child: Text('Register'))
                  ],),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}