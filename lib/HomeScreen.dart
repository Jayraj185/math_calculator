import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String eql = "=";
  String ac = "AC";
  int fnum=0;
  int snum=0;
  String result="";
  String operator="";
  String text="00";
  String text2="";
  bool swich = false;
  void Result(String btnclick)
  {
    if(btnclick == ac)
      {
        fnum=0;
        snum=0;
        result="00";
        text = "00";
        text2 = "";
      }
    else if(btnclick == "+" || btnclick == "-" || btnclick == "*" || btnclick == "/" || btnclick == "%")
      {
        fnum = int.parse(text);
        result = "";
        operator = btnclick;
      }
    else if(btnclick == eql)
    {
      snum = int.parse(text);
      if(operator == "+")
        {
          result = (fnum + snum).toString();
          text2 = fnum.toString() + operator.toString() + snum.toString();
        }
      if(operator == "-")
      {
        result = (fnum - snum).toString();
        text2 = fnum.toString() + operator.toString() + snum.toString();
      }
      if(operator == "*")
      {
        result = (fnum * snum).toString();
        text2 = fnum.toString() + operator.toString() + snum.toString();
      }
      if(operator == "/")
      {
        result = (fnum / snum).toString();
        text2 = fnum.toString() + operator.toString() + snum.toString();
      }
      if(operator == "%")
      {
        result = (fnum % snum).toString();
        text2 = fnum.toString() + operator.toString() + snum.toString();
      }
    }
    else
      {
        result = int.parse(text + btnclick).toString();
      }
    setState(() {
      text = result;
    });

  }
  Widget Button(String click)
  {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            Result(click);
          });
        },
        child: Container(
          height: 85,
          width: 98,
          // color: swich==false?Colors.white:Colors.black,
          alignment: Alignment.center,
          child: Text(
            "$click",
            style: TextStyle(
                fontSize: 30,
                color: swich==false?Colors.black:Colors.white,
                //fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  Widget Oper(String oper)
  {
    return Expanded(
      child: InkWell(
        onTap: (){
          Result(oper);
        },
        child: Container(
          height: 85,
          width: 98,
          // color: swich==false?Colors.white:Colors.black,
          alignment: Alignment.center,
          child: Text(
            "$oper",
            style: TextStyle(
              color: Color(0xFFFF5A66),
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  var darktheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.black,),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.red)),
      brightness: Brightness.dark
  );
  var lighttheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.red,),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.yellowAccent)),
      brightness: Brightness.light
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: swich==false?lighttheme:darktheme,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Calculator"),
              centerTitle: true,
              leading: GestureDetector(onTap: (){setState(() {
                swich = !swich;
              });},child: swich==false?Icon(Icons.light_mode):Icon(Icons.dark_mode_outlined))
            ),
            body: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0,bottom: 3),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "$text2",
                          style: TextStyle(
                              color: Color(0xFF8D8D8D),
                              fontSize: 20,
                              letterSpacing: 2
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:185,right: 25.0,bottom: 5),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "$text",
                          style: TextStyle(
                              color: swich==false?Colors.black:Colors.white,
                              fontSize: 70,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 6),
                      child: Divider(thickness: 1.5,),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Result(ac);
                          },
                          child: Container(
                            height: 85,
                            width: 196,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF5A66),
                                borderRadius: BorderRadius.circular(60)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "$ac",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Oper("%"),
                        Oper("/"),
                      ],
                    ),
                    Row(
                      children: [
                        Button("7"),
                        Button("8"),
                        Button("9"),
                        Oper("*"),
                      ],
                    ),
                    Row(
                      children: [
                        Button("4"),
                        Button("5"),
                        Button("6"),
                        Oper("-"),
                      ],
                    ),
                    Row(
                      children: [
                        Button("1"),
                        Button("2"),
                        Button("3"),
                        Oper("+"),
                      ],
                    ),
                    Row(
                      children: [
                        Button("00"),
                        Button("0"),
                        Button("."),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Result(eql);
                            },
                            child: Container(
                              height: 85,
                              width: 98,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF5A66),
                                  shape: BoxShape.circle
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "$eql",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
