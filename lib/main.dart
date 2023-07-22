import 'package:flabsen/screens/screen_users.dart';
import 'package:flabsen/state/state_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Absen Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: ChangeNotifierProvider(
          create: (_) => StateLogin(),
          child: Consumer<StateLogin>(
            builder: (context, state, _) => Center(
                child: SizedBox(
              width: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Login'),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: state.unameController,
                        decoration: InputDecoration(
                          label: const Text('Username'),
                          prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.blue,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          // hintText: 'Email',
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: state.passController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('* * *', style: TextStyle(color: Colors.blue),),
                              Container(
                                width: 30,
                                height: 2,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          // hintText: 'Email',
                        ),
                      )
                      // TextFormField(
                      //   controller: state.passController,
                      //   obscureText: true,
                      //   decoration:
                      //       Style.textInputDecorSuffixPrefix(
                      //         label: 'Password',
                      //         iconPrefix: Container(
                      //           width: 50,
                      //           child: Column(
                      //             children: [
                      //               Text('* * *'),
                      //               Container(
                      //                 width: 30,
                      //                 height: 2,
                      //                 color: Colors.blue,
                      //               )
                      //             ],
                      //           ),
                      //         )
                      //       ),
                      // ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            state.prosesLogin().then((value) {
                              if(state.loadingLogin == LoadState.error){
                                final snackBar = SnackBar(
                                  content: Text(state.errorMesssage),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                return;
                              }
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ScreenUser(token: state.loginToken),
                                ),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(4)),
                              elevation: 0),
                          child: const Padding(
                            padding: EdgeInsets.only(),
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: fontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto")),
                          )),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
