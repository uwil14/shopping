import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Provider/UnicoProvider.dart';
import 'package:sizer/sizer.dart';

class Administracion extends StatefulWidget {
  const Administracion({Key? key}) : super(key: key);

  @override
  _AdministracionState createState() => _AdministracionState();
}

class _AdministracionState extends State<Administracion> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<UnicoProvider>(context);

    return datosProvider.auth
        ? (MediaQuery.of(context).orientation == Orientation.landscape
            ? Container(
                margin: EdgeInsets.only(left: 80.w),
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
                    Container(
                      margin: EdgeInsets.only(right: 3.h),
                      child: Image.asset(
                        "images/logo.png",
                        width: 30.h,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  vertical: 0.h,
                ),
                padding: EdgeInsets.only(
                    top: 5.h, left: 1.h, bottom: 2.h, right: 1.h),
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2.w),
                      child: Image.asset(
                        "images/logo.png",
                        width: 25.w,
                      ),
                    )
                  ],
                ),
              ))
        : Container();
  }
}
