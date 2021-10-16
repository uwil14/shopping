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

    Widget pisos(Widget p, String nombre, int piso) {
      return Container(
        margin: EdgeInsets.all(1.w),
        padding: EdgeInsets.all(0.5.w),
        height: 10.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xff0D7D34))),

            primary: Color(0xff0D7D34), // background
            onPrimary: Colors.white,
          ),
          onPressed: () {
            if (datosProvider.piso==piso) {
            } else {
              datosProvider.planta = p;
              datosProvider.piso=piso;
            }
          },
          child: Container(
            child: Text(nombre,style: TextStyle(fontSize: 8.sp),),
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
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialogBox(
                            text: 'Iniciar Sesion',
                            descriptions: 'Escriba sus datos correctamente',
                            title: 'Iniciar Session',
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 3.h),
                    child: Image.asset("images/logo.png",width: 30.h,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Text(
                    "Escoja un piso para ver las tiendas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 3.sp,
                      fontFamily: "MontserratMediumItalic",
                    ),
                  ),
                ),
                Container(
                  height: 15.h,
                  child: pisos(PrimerPiso(), "Planta 1",1),
                ),
                Container(
                  height: 15.h,
                  child: pisos(SegundoPiso(), "Planta 2",2),
                ),
                Container(height: 15.h, child: pisos(TercerPiso(), "Planta 3",3)),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 0.h,),
            padding: EdgeInsets.only(top:5.h,left: 1.h,bottom: 2.h,right: 1.h),
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                ],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialogBox(
                            text: 'Iniciar Sesion',
                            descriptions: 'Escriba sus datos correctamente',
                            title: 'Iniciar Session',
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 2.w),
                    child: Image.asset("images/logo.png",width: 25.w,),
                  ),
                )
                ,

                Expanded(
                  child: pisos(PrimerPiso(), "Planta 1",1),
                ),
                Expanded(
                  child: pisos(SegundoPiso(), "Planta 2",2),
                ),
                Expanded(
                    child: pisos(TercerPiso(), "Planta 3",3)),
              ],
            ),
          );
  }
}
