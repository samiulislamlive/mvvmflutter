
import 'package:flutter/material.dart';

import '../utils/utils.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
            onTap: (){
              Utils.flushBarErrorMessage("No internet", context,Colors.red,Icon(Icons.error));
              Utils.snackBar(context,"Testing SnackBar");
            },
            child: Text("Click"))
      ),
    );
  }
}
