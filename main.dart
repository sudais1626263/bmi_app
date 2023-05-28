import 'package:bmi_app/splash_screen.dart';
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
      title: 'The BMI app',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var wtcontroller=TextEditingController();
 var ftcontroller=TextEditingController();
 var incontroller=TextEditingController();
 var msg="";
 var color=Colors.black26;




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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.purple,
        title: Text("BMI app"),

      ),
      body: Container(
        color: color,
        child: Center(
          child: Container(
            width: 300,
            child: Column(

              children: [
                Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                SizedBox(height: 11,),
                TextField(
                  controller: wtcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in kgs"),
                    prefixIcon: Icon(Icons.line_weight_sharp)
                  ),

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Enter your height in meters"),
                      prefixIcon: Icon(Icons.height)
                  ),

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: incontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Enter your height in inches"),
                      prefixIcon: Icon(Icons.height)
                  ),

                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){

                  var wt= wtcontroller.text.toString();
                  var ft=ftcontroller.text.toString();
                  var inc= incontroller.text.toString();
                  if(wt!=""&& ft!=""&& inc!=""){
                    var iWt=int.parse(wt);
                    var iFt=int.parse(ft);
                    var iInc=int.parse(inc);
                    var tInc= (iFt*12)+ iInc;

                    var tCm= tInc*2.54;
                    var tm= tCm/100;
                    var bmi= iWt/(tm*tm);
                    msg="Your bmi is ${bmi.toStringAsFixed(2)}";
                    var msg2= "";
                    if (bmi<25){
                      msg2="you are over weight!!!";
                      color=Colors.redAccent.shade100;
                    }else if(bmi>18){
                      msg2="you are under weight!!!";
                      color=Colors.white30;
                    }else{
                      msg2= "woh!! you are fit";
                      color=Colors.amberAccent;
                    }
                    setState(() {

                    });
                  }else{
                    setState(() {
                       msg="please input all fields";
                    });
                  }
                }, child: Text("Calculate",),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),),

                Text("$msg",style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
