import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {required this.title, required this.descriptions, required this.text});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  double constantsPadding = 5.w;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final datosProvider = Provider.of<UnicoProvider>(context);
    final passwordController = TextEditingController();
    final usuarioController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ListView(
          children: [
            Container(
              margin: MediaQuery.of(context).orientation == Orientation.portrait
                  ? EdgeInsets.only(left: 1.w, right: 1.w, top: 12.h)
                  : EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45, spreadRadius: 1, blurRadius: 10),
                  ]),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        right: 2.w, left: 2.w, bottom: 5.h, top: 10.h),
                    child: Text(
                      "Ingrese sus datos correctamente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "MontserratMediumItalic",
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 3.h, right: 3.h),
                          child: TextFormField(
                              controller: usuarioController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Usuario',
                                  hintText: 'Ingrese su nombre de usuario'),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Requerido"),
                              ])),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Contraseña',
                                  hintText: 'Ingrese su contraseña'),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Requerido"),
                              ])
                            //validatePassword,        //Function to check validation
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  height: 15.h,
                                  margin:
                                  EdgeInsets.only(left: 3.h, right: 3.h),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          if (usuarioController.text ==
                                              "admin" &&
                                              passwordController.text ==
                                                  "123456") {
                                            datosProvider.auth = true;
                                            Navigator.of(context).pop();
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: Color(0xff2C3095))),

                                        primary:
                                        Color(0xff2C3095), // background
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text(
                                        widget.text,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "MontserratSemiBold",
                                          color: Colors.white,
                                        ),
                                      ))),
                            ),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  height: 15.h,
                                  margin:
                                  EdgeInsets.only(left: 3.h, right: 3.h),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: Colors.black)),

                                        primary: Colors.black, // background
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text(
                                        "Volver",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "MontserratSemiBold",
                                          color: Colors.white,
                                        ),
                                      ))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 10.h,
            child: ClipRRect(child: Image.asset("images/logo.png")),
          ),
        ),
      ],
    );
  }
}
