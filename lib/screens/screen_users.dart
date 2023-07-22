import 'package:flabsen/state/state_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenUser extends StatefulWidget {
  const ScreenUser({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<ScreenUser> createState() => _ScreenUserState();
}

class _ScreenUserState extends State<ScreenUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Data User"),
        ),
        body: ChangeNotifierProvider(
          create: (_) => StateUser(widget.token),
          child: Consumer<StateUser>(
            builder: (context, state, _) => Center(
                child: Container(
                  width: 500,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(width: 20,child: Text('Id', style: TextStyle(fontWeight: FontWeight.bold),)),
                          Expanded(child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold),)),
                          Expanded(child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(width: 500, height: 2, color: Colors.grey,),
                      ...state.dataEmployee.map((e) {
                        return Column(
                          children: [
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(width: 20,child: Text('${e.employeeId!}',)),
                                Expanded(child: Text(e.employeeName!,)),
                                Expanded(child: Text(e.employeeMail!,)),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Container(width: 500, height: 2, color: Colors.grey,),
                          ],
                        );
                      })
                    ],
                  ),
                ),
            ),
          ),
        )
    );
  }
}
