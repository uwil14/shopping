import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Herramientas/PrimerPiso.dart';
import 'package:shopping/Herramientas/SegundoPiso.dart';
import 'package:shopping/Herramientas/TercerPiso.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

import 'custom_dialog_box.dart';

class Informacion extends StatefulWidget {
  @override
  _InformacionState createState() => _InformacionState();
}

class _InformacionState extends State<Informacion> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<UnicoProvider>(context);

    Widget pisos(String nombre, int piso) {
      return Container(
        padding: EdgeInsets.all(0.5.w),
        height: 10.h,
        width: 18.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xff0D7D34))),

            primary: Color(0xff0D7D34), // background
            onPrimary: Colors.white,
          ),
          onPressed: () {
            if (datosProvider.piso == piso) {
            } else {
              datosProvider.piso = piso;
            }
          },
          child: Container(
            child: Text(
              nombre,
            ),
          ),
        ),
      );
    }

    return MediaQuery.of(context).orientation == Orientation.landscape
        ? Container(
            width: 20.w,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 5, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!datosProvider.auth) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomDialogBox(
                                    text: 'Iniciar Sesion',
                                    descriptions:
                                        'Escriba sus datos correctamente',
                                    title: 'Iniciar Session',
                                  );
                                });
                          }
                        },
                        child: Container(
                          child: Image.asset(
                            "images/logo.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      child: Text(
                        "Escoja un piso para ver las tiendas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 3.sp,
                          fontFamily: "MontserratMediumItalic",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: pisos("Planta 1", 1),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: pisos("Planta 2", 2),
                      ),
                    ),
                    Expanded(
                      child: Container(child: pisos("Planta 3", 3)),
                    )
                  ],
                ))
              ],
            ),
          )
        : Container(
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 5, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!datosProvider.auth) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              text: 'Iniciar Sesion',
                              descriptions: 'Escriba sus datos correctamente',
                              title: 'Iniciar Session',
                            );
                          });
                    }
                  },
                  child: Container(
                    child: Image.asset(
                      "images/logo.png",
                      width: 30.w,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      child: Text(
                        "Escoja un piso para ver las tiendas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "MontserratMediumItalic",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: pisos("Planta 1", 1),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: pisos("Planta 2", 2),
                          ),
                        ),
                        Expanded(
                          child: Container(child: pisos("Planta 3", 3)),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          );
  }
}
