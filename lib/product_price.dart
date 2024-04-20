import 'package:flutter/material.dart';

class ProductPrice extends StatefulWidget {
  const ProductPrice({super.key});

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {

  TextEditingController priceController=TextEditingController();
  TextEditingController qtyController=TextEditingController();
  TextEditingController discountController=TextEditingController();


  convert(String input){
    List <String> en=["1","2","3","4","5","6","7","8","9","0",];
    List <String> bn=["১","২","৩","৪","৫","৬","৭","৮","৯","০",];
    for(int i=0; i<en.length; i++){
      input=input.replaceAll(en[i], bn[i]);
    }
    return input;
  }
var result;
calculate(){
  int price = int.parse(priceController.text);
  int qty = int.parse(qtyController.text);
  int discount = int.parse(discountController.text);
  int total= (price*qty)*discount~/100;


  setState(() {
    result=total.toString();
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Product Price'), centerTitle: true),
        body: Column(
          children: [
            Divider(),
            SizedBox(
              width: 300,
              child: TextField(controller: priceController,
                decoration: InputDecoration(
                    hintText: "Product price...",
                    prefixIcon: Icon(Icons.attach_money_sharp),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: 300,
              child: TextField(controller: qtyController,
                decoration: InputDecoration(
                  hintText: "Quantity...",
                  prefixIcon: Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: 300,
              child: TextField(controller: discountController,
                decoration: InputDecoration(
                  hintText: "Except discount...",
                  prefixIcon: Icon(Icons.percent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Divider(),
            ElevatedButton(onPressed: (){
              calculate();
            }, child: Text('Calculate')),
            Divider(),
            Container(child: result==null? Text('উপরের খালিঘর গুলো পূরণ করুন এবং ক্যালকুলেট বাটনে প্রেস করুন'):Text('আপনি ${convert(result)}৳ ডিসকাউন্ট পেয়েছেন!'),)
          ],
        ),
      ),
    );
  }
}
