import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingInterview extends StatefulWidget {
  const UpcomingInterview({Key? key}) : super(key: key);

  @override
  State<UpcomingInterview> createState() => _UpcomingInterviewState();
}

class _UpcomingInterviewState extends State<UpcomingInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height* 0.03,0,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
                PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: SizedBox(width: 100 ,child: Text("Setting ",style: TextStyle(color: Colors.black),)),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: SizedBox(width: 100 ,child: Text("About ",style: TextStyle(color: Colors.black),)),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: SizedBox(width: 100 ,child: Text("Exit ",style: TextStyle(color: Colors.black),)),
                    ),
                  ],
                  onSelected: (item) => {print(item)},
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
