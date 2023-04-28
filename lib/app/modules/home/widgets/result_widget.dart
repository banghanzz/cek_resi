import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/summary_provider.dart';
import '../../../data/models/summary_model.dart';
import '../controllers/home_controller.dart';

Widget makeDismissible({required Widget child}) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.back(),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );

Widget resultSheet() => makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.82,
        builder: (context, builder) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: ListView(
              children: [
                //Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.close_rounded,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),

                //Detil Pengiriman
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Detil Pengiriman",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 1.05,
                        color: Color(0xFF5A5A5A)),
                  ),
                ),

                //Card
                SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: FutureBuilder(
                        future: HomeController().getSummary(),
                        builder: (context, snap) {
                          return Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //No Resi

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Nomor Resi",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("1234567890",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),

                                      //Courier Logo

                                      Container(
                                        child: Image.asset(
                                          'assets/images/cekresi_logo.png',
                                          height: 28,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Service Courier

                                  SizedBox(
                                    height: 16,
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Layanan",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("REG",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Pengirim & Penerima

                                  SizedBox(
                                    height: 16,
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Pengirim

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Pengirim",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("ANIS",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),

                                      //Penerima

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Penerima",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("ARIEF RAHMAT HIDAYAT",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Asal & Tujuan

                                  SizedBox(
                                    height: 16,
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Asal

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Asal",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("Tangerang, Banten",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),

                                      //Tujuan

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Tujuan",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("Cirebon, Jawa Barat",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Status

                                  SizedBox(
                                    height: 16,
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Status",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    fontSize: 10,
                                                    color: Color(0xFF7a7a7a))),
                                            Text("DELIVERED",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    fontSize: 14,
                                                    color: Color(0xFF555555)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                //Detil Pengiriman

                SizedBox(
                  height: 24,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Perjalanan Paketmu",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 1.05,
                        color: Color(0xFF5A5A5A)),
                  ),
                ),
              ],
            )),
      ),
    );
