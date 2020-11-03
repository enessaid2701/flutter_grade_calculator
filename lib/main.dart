import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'fade_animation.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController vizeController = TextEditingController();
  TextEditingController finallController = TextEditingController();

  showToast(String message) {
    Toast.show('$message', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

  Future<void> alertDialog(double ortalama, String harfNotu) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$ortalama'),
                Text('$harfNotu'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int vize;
  int finall;
  double ortalama;
  String harfNotu;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xdd0d7377),
        title: Center(
          child: Text(
            "Not Hesaplayıcı",
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                            child: TextFormField(
                            /*  validator: (value) {
                                if (vizeController.text.isEmpty) {
                                  return 'Geçerli bir değer giriniz';
                                }
                                return null;
                              },*/
                              keyboardType: TextInputType.number,
                              controller: vizeController,
                              style: TextStyle(color: Color(0xdd0d7377)),
                              // controller: amountController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 0.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 2.0),
                                ),
                                labelText: 'vize notu',
                                labelStyle: TextStyle(
                                    color: Color(0xdd0d7377), fontSize: 18.0),
                              ),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: finallController,
                              style: TextStyle(color: Color(0xdd0d7377)),
                              // controller: amountController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 0.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 2.0),
                                ),
                                labelText: 'final notu',
                                labelStyle: TextStyle(
                                    color: Color(0xdd0d7377), fontSize: 18.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              elevation: 12,
                              child: Container(
                                width: 100,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    "hesapla",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              color: Color(0xdd0d7377),
                              onPressed: () {
                                if (vizeController.text.isEmpty ||
                                    finallController.text.isEmpty) {
                                  TextFormField();
                                  showToast("lütfen not giriniz");
                                } else {
                                  vize = int.parse(vizeController.text);
                                  finall = int.parse(finallController.text);
                                  if (vize < 0 ||
                                      vize > 100 ||
                                      finall < 0 ||
                                      finall > 100) {
                                    showToast(
                                        "lütfen geçerli bir değer giriniz");
                                  } else {
                                    ortalama = ((vize * 0.4) + (finall * 0.6));
                                    if (ortalama <= 100 && ortalama > 80) {
                                      harfNotu = "Harf notunuz : AA";
                                    } else if (ortalama <= 80 &&
                                        ortalama > 70) {
                                      harfNotu = "Harf notunuz : BA";
                                    } else if (ortalama <= 70 &&
                                        ortalama > 60) {
                                      harfNotu = "Harf notunuz : CB";
                                    } else if (ortalama <= 60 &&
                                        ortalama > 50) {
                                      harfNotu = "Harf notunuz : DC";
                                    } else if (ortalama < 50 && ortalama > 0) {
                                      harfNotu = "Harf notunuz : FF";
                                    }
                                    alertDialog(ortalama, harfNotu);
                                  }
                                }
                              },
                            ),
                          ),
                          /* Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xdd0d7377)),
                              readOnly: true,
                              controller: harfNotuController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 0.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xdd0d7377), width: 2.0)),
                                border: UnderlineInputBorder(),
                                hintText: 'harf notu:',
                                hintStyle: TextStyle(
                                  color: Color(0xdd0d7377),
                                ),
                              ),
                              onTap: () {
                                //if () {}
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xdd0d7377)),
                              readOnly: true,
                              controller: ortalamaController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xdd0d7377), width: 0.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xdd0d7377), width: 2.0)),
                                border: UnderlineInputBorder(),
                                hintText: 'ortalama:',
                                hintStyle: TextStyle(
                                  color: Color(0xdd0d7377),
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
