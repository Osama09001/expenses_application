import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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



 final TextEditingController  _expDescription =  TextEditingController() ;
  final TextEditingController  _expAmount =  TextEditingController() ;


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Expenses App"),
       
      ),
      body: Center(     
        child: Card(
          elevation: 20,
          child: Column(        
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                
                'Enter Expense Detail',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: TextField(                  
                decoration: InputDecoration(
                  hintText: "Enter Expense Description",
                  border: OutlineInputBorder()
                ),
                controller: _expDescription,
                
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Expense Amount Here",
                    border: OutlineInputBorder()
                  ),
                controller: _expAmount,
                
                ),
              ),
              SizedBox(height: 10,),
              // ElevatedButton(onPressed: (){
              //   showDialog(context: context,
              //               builder: (BuildContext context) {
          
              //                 return AlertDialog(
                              
              //                   title: const Text("Show Alert Dialog"),
              //                   content: const Text("Do you really want to Show Message"),
              //                   actions: [
              //                     ElevatedButton(onPressed: (){print(_expDescription.text);}, child: const Text("Yes"),),
              //                     ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("No"),),
              //                   ],
              //                 );
          
          
              //   },
              //   barrierDismissible: false);
          
          
                
              // }, child: const Text('Upload'),),
          
              ElevatedButton(onPressed: () async {
          
          
          
               var  res = await http.post(Uri.parse("http://172.16.14.118:8081/create_expense"),
                   headers: {"Content-Type": "application/json"},
               body:jsonEncode({
                      "description" : _expDescription.text,
                      "amount" : _expAmount.text
                  }),
                  );
                  

                var b =  jsonDecode(res.body);

                 if  (b['response'] == "success" ){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title:   Text("Alert"),
                      content: Text("Expense has been Save"),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Ok"))
                      ],
                    );
                  });

                 }
                  
          
                  
          
          
          
              }, child: Text("Add Expense"))
              
            ],
          ),
        ),
      )
    );
  }
}
