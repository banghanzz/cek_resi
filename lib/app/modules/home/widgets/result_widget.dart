import 'package:cek_resi/app/data/models/history_model.dart';
import 'package:cek_resi/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              //Up Sheet Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Close Button
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

              //Main Panel
              Expanded(
                child: ListView(
                  children: [
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
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //No Resi
                                FutureBuilder(
                                    future: HomeController().getDataSummary(),
                                    builder: (context, snap) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Nomor Resi",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.awb}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
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
                                      );
                                    }),

                                //Service Courier
                                SizedBox(
                                  height: 16,
                                ),
                                FutureBuilder(
                                    future: HomeController().getDataSummary(),
                                    builder: (context, snap) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Layanan",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.service}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),

                                //Pengirim & Penerima
                                SizedBox(
                                  height: 16,
                                ),
                                FutureBuilder(
                                    future: HomeController().getDataDetail(),
                                    builder: (context, snap) {
                                      return Row(
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.shipper}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.receiver}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),

                                //Asal & Tujuan
                                SizedBox(
                                  height: 16,
                                ),
                                FutureBuilder(
                                    future: HomeController().getDataDetail(),
                                    builder: (context, snap) {
                                      return Row(
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.origin}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text(
                                                    "${snap.data?.destination}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),

                                //Status
                                SizedBox(
                                  height: 16,
                                ),
                                FutureBuilder(
                                    future: HomeController().getDataSummary(),
                                    builder: (context, snap) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Status",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xFF7a7a7a))),
                                                Text("${snap.data?.status}",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF555555)))
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
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
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<List<History>>(
                                    future: HomeController().getDataHistory(),
                                    builder: (context, snap) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: snap.data?.length,
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return ListBody(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 16),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "${snap.data?[index].date}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1.5,
                                                                fontSize: 10,
                                                                color: Color(
                                                                    0xFF7a7a7a))),
                                                        Text(
                                                            "${snap.data?[index].desc}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.5,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFF555555))),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            }
                                            return ListBody(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "${snap.data?[index].date}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.5,
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xFF7a7a7a))),
                                                      Text(
                                                          "${snap.data?[index].desc}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.5,
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xFF555555))),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
