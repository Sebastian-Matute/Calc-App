import 'package:flutter/material.dart';
import 'validation.dart';

class FractionAdd extends StatefulWidget {
  @override
  _FractionAddState createState() => _FractionAddState();
}

class _FractionAddState extends State<FractionAdd> {
  double f1Num, f1Den, f2Num, f2Den;
  String result = "";
  var validation = Validation(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                      icon: Icon(
                        Icons.clear_rounded,
                        size: MediaQuery.of(context).size.width * 0.07,
                        color: Color(0xff494D5F),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }))
            ],
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.07,
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.width * 0.07,
          MediaQuery.of(context).size.height * 0.03,
        ),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Addition Calculator",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.14,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025,
                      bottom: MediaQuery.of(context).size.height * 0.06),
                  child: Text("Calculate addition of two fractions",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      )),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  f1Num = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Numerator",
                                hintStyle: TextStyle(color: Color(0xff494D5f)),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  f1Den = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Denominator",
                                hintStyle: TextStyle(color: Color(0xff494D5f)),
                              )),
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  f2Num = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Numerator",
                                hintStyle: TextStyle(color: Color(0xff494D5f)),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  f2Den = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Denominator",
                                hintStyle: TextStyle(color: Color(0xff494D5f)),
                              )),
                        ),
                      ]),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: RaisedButton(
                    onPressed: () {
                      if (validation.isEmpty(f1Num) ||
                          validation.isEmpty(f1Den) ||
                          validation.isEmpty(f2Num) ||
                          validation.isEmpty(f2Den)) {
                        validation.showToastText();
                      } else if (validation.isZero(f1Den) || validation.isZero(f2Den)) {
                        validation.showToastZero();
                      } else {
                        setState(() {
                          double n = (f1Num * f2Den) + (f2Num * f1Den); 
                          double d = (f1Den * f2Den); 
                          result = (n.toString() + "/" + d.toString()).toString();
                        });
                      }
                    },
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Calculate",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Result",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.14,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(result,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ))
              ],
            )),
      ),
    );
    ;
  }
}
