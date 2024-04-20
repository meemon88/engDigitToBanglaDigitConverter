import 'package:flutter/material.dart';
import 'package:untitled/product_price.dart';

void main() {
  runApp(ProductPrice());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myfullresult;
  TextEditingController _buyPrice = TextEditingController();
  TextEditingController _sellingPrice = TextEditingController();

myMethod(){
  int buyPrice = int.parse(_buyPrice.text);
  int sellingPrice = int.parse(_sellingPrice.text);
  int result = sellingPrice-buyPrice;
  setState(() {

    myfullresult = result.toString();
    print(myfullresult);
  });
}

  // var result =0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Simple Calculator"),
          centerTitle: true,
          leading: Icon(Icons.menu),
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.translate))]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              height: 200,
              width: 400,
              child: myfullresult == null ? Container() :
              new Center(
                      child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myfullresult.toString().contains("-") ? Text("Your loss Amount is ${myfullresult.toString()}"):Text('Your neet Profit ${myfullresult.toString()}'),


                      ),
                    )) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("images/business.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 60,
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _buyPrice,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money),
                        label: Text('Buy price'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 60,
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _sellingPrice,
                    decoration: InputDecoration(
                        label: Text('Selling price'),
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                myMethod();
                },
                child: Text('Show Result'))
          ],
        ),
      ),
    );
  }
}


