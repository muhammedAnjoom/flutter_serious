import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DukkanScreen extends StatelessWidget {
  const DukkanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.blue,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                                  const SizedBox(width: 90),
                                  const Text("Dukkan Premium",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),)
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      height: 180,
                      // width: 100,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
