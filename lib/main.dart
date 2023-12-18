import 'package:flutter/material.dart';

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



 final TextEditingController  _con =  TextEditingController() ;


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Expenses App"),
       
      ),
      body: Center(     
        child: Column(        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              
              'Expenses Form',
            ),
            TextField(
            controller: _con,

            ),
            ElevatedButton(onPressed: (){
              showDialog(context: context,
                          builder: (BuildContext context) {

                            return AlertDialog(
                            
                              title: const Text("Alert Dialog"),
                              content: const Text("Do you really want to Show Message"),
                              actions: [
                                ElevatedButton(onPressed: (){print(_con.text);}, child: const Text("Yes"),),
                                ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("No"),),
                              ],
                            );


              },
              barrierDismissible: false);


              
            }, child: const Text('Upload'),),
            
          ],
        ),
      )
    );
  }
}
