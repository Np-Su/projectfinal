import 'package:flutter/material.dart';
import 'package:project/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  void goPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => homePage()
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'เครื่องคำนวณหาค่าดัชนีมวลกาย (BMI)',
              style:TextStyle(height: 1,fontSize: 35),
            ),
            /*  Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
            Padding(
              padding: const EdgeInsets.only(left:40.0,right: 40.0,top: 15.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 550,
                        child: TextField(
                          controller: weightController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'น้ำหนักตัว (KG.)',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: 550,
                        child: TextField(
                          controller: heightController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ส่วนสูง (CM.)',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(180, 50), //////// HERE
                            ),
                            onPressed: () {
                              var inputWeight = int.tryParse(weightController.text);
                              var inputHeight = int.tryParse(heightController.text);
                              if (inputWeight is int != true || inputHeight is int != true) {
                                showDialog( //แจ้งว่ากรอกอักษรแปลก ๆ
                                    context: context,
                                    barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                                    builder:(BuildContext context) {
                                      return AlertDialog(
                                          title: Text('RESULT'),
                                          content: Text('กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น'),
                                          actions:[
                                            ElevatedButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                                child: Text('OK'))
                                          ]
                                      );
                                    });
                              }else{
                                // print(game.doGuess(inputChangType!));
                                showDialog(
                                    context: context,
                                    barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                                    builder:(BuildContext context) {
                                      return AlertDialog(
                                          title: Text('ค่า BMI ที่คำนวณได้'),
                                          content: Text(BMI(inputWeight!,inputHeight!)),
                                          actions:[
                                            ElevatedButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                                child: Text('OK'))
                                          ]
                                      );
                                    });
                              }
                            },
                            child: Text('คำนวณ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                                shadowColor: Colors.redAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: Size(180, 50), //////// HERE
                              ),
                              onPressed: goPage,
                              child: Text('ผลกระทบจากโรคอ้วน')
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      Image(
                        image: AssetImage('assets/images/bmi.jpg'),
                        fit: BoxFit.contain,
                        width: 500,
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}
String BMI(int Weight,int Height){
  var cmToM = Height/100;
  var calresultBMI = Weight/(cmToM*cmToM);

  var resultBMI = calresultBMI;
  var strResultBMI = resultBMI.toStringAsFixed(2);

  if(calresultBMI < 18.50){
    return 'ค่า BMI = $strResultBMI มีภาวะน้ำหนักตัว : ต่ำกว่าเกณฑ์';
  }else if(resultBMI >=18.5 && resultBMI <=22.9){
    return 'ค่า BMI = $strResultBMI มีภาวะน้ำหนักตัว : สมส่วน';
  }else if(resultBMI >=23.0 && resultBMI <=24.9){
    return 'ค่า BMI = $strResultBMI มีภาวะน้ำหนักตัว : น้ำหนักเกิน';
  }else if(resultBMI >=25.0 && resultBMI <=29.9){
    return 'ค่า BMI = $strResultBMI มีภาวะน้ำหนักตัว : โรคอ้วน';
  }else{
    return 'ค่า BMI = $strResultBMI มีภาวะน้ำหนักตัว : โรคอ้วนอันตราย';
  }
}
