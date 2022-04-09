import 'package:flutter/material.dart';
import 'package:project/main.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }

}
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key) {
  }

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  void goPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyApp()
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: const Text('Main Page'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning, // รูปไอคอน
                          size: 60.0, // ขนาดไอคอน
                          color: Colors.red, // สีไอคอน
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'ผลกระทบจากโรคอ้วน',
                          style: TextStyle(
                            fontSize: 38.0,
                            color: Colors.red.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            '''
                         1. โรคหลอดเลือดหัวใจและสมอง 
                         2. โรคความดันโลหิตสูง 
                         3. โรคไขมันในเลือดสูง
                         4. โรคเบาหวาน
                         5. โรคไขมันเกาะตับ
                         6. โรคหัวใจโรคอัมพฤกษ์ 
                         7. อัมพาต 
                         8. โรคมะเร็งต่างๆ 
                         9. โรคหยุดหายใจขณะหลับ
                         10. ปัญหาทางระบบทางเดินหายใจ
                         11. ภาวะมีบุตรยาก
                         12. ประจำเดือนมาไม่ปกติ
                         13. ปวดข้อ ข้อเสื่อมก่อนวัย
                         14. โรคผิวหนัง เช่น สิว ขนดก ผิวหนังติดเชื้อ มีกลิ่นตัว เป็นต้น 
                          ''',
                            overflow: TextOverflow.visible,
                            maxLines: 15,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 25,
                              height: 1.6,
                              //fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.blueAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: goPage,
                            child: Text('BACK')
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}