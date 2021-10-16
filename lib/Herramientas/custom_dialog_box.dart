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
  static const double constantsPadding = 20;
  static const double constantsAvatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constantsPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final passwordController = TextEditingController();
    final usuarioController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Stack(
      children: [
        Container(
          height: 55.h,
          padding: const EdgeInsets.only(
              left: constantsPadding,
              top: constantsAvatarRadius + constantsPadding,
              right: constantsPadding,
              bottom: constantsPadding),
          margin: MediaQuery.of(context).orientation == Orientation.portrait
              ? EdgeInsets.only(
                  top: constantsAvatarRadius, left: 5.w, right: 5.w)
              : EdgeInsets.only(
                  top: constantsAvatarRadius, left: 30.w, right: 30.w),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(constantsPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45, spreadRadius: 1, blurRadius: 10),
              ]),
          child: ListView(

            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  "Ingrese sus datos correctamente",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 3.sp,
                    fontFamily: "MontserratMediumItalic",
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 5.h),
                      child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
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
                      margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 4.h),
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
                              height: 5.h,
                              margin: EdgeInsets.only(
                                  left: 3.h, right: 3.h, top: 4.h),
                              child: ElevatedButton(
                                  onPressed: () {
                                   SystemNavigator.pop();
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
                        Expanded(
                          child: Container(
                              height: 5.h,
                              margin: EdgeInsets.only(
                                  left: 3.h, right: 3.h, top: 4.h),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {

                                      if(usuarioController.text=="admin"&&passwordController.text=="123456"){
                                        final datosProvider = Provider.of<UnicoProvider>(context);
                                        datosProvider.auth=true;
                                      }

                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color: Color(0xff2C3095))),

                                    primary: Color(0xff2C3095), // background
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: constantsPadding,
          right: constantsPadding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: constantsAvatarRadius,
            child: ClipRRect(

                child: Image.asset("images/logo.png")),
          ),
        ),
      ],
    );
  }
}
