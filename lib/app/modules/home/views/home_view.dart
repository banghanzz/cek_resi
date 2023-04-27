import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<Map<String, String>> courierList = [
    {"courier_id": "1", "courier_name": "JNE Express"},
    {"courier_id": "2", "courier_name": "J&T Express"},
    {"courier_id": "3", "courier_name": "SiCepat Express"},
    {"courier_id": "4", "courier_name": "POS Indoensia"},
    {"courier_id": "5", "courier_name": "AnterAja"},
    {"courier_id": "6", "courier_name": "Ninja Express"},
    {"courier_id": "7", "courier_name": "Shopee Express"},
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              //Logo
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Image.asset(
                      'assets/images/cekresi_logo.png',
                      height: 42,
                    ),
                  ),
                ],
              ),

              //Desc Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Ayo lacak paketmu, udah sampai mana hari ini ?",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 1.05,
                      color: Color(0xFF7A7A7A)),
                ),
              ),

              //Courier Options Dropdown
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      )
                    ]),
                    child: DropdownSearch<Map<String, String>>(
                      popupProps: PopupProps.menu(
                          menuProps: MenuProps(
                              barrierColor: Colors.black.withOpacity(0.3),
                              shadowColor: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      items: courierList,
                      itemAsString: (item) => item["courier_name"].toString(),
                      onChanged: (value) => print(value),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              label: Text("Pilih Kurir"),
                              labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Color(0xFF8a8a8a),
                                  fontWeight: FontWeight.w400))),
                    )),
              ),

              //AWB Field
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    )
                  ]),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        label: Text("Nomor Resi"),
                        labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xFF8a8a8a),
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),

              //Button
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet<dynamic>(
                      
                      Container(
                        height: 1000,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.png'),
                                fit: BoxFit.cover)),
                        child: ListView(
                          children: [
                            //Detil Pengiriman
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("1234567890",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("REG",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("ANIS",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("ARIEF RAHMAT HIDAYAT",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("Tangerang, Banten",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("Cirebon, Jawa Barat",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xFF7a7a7a))),
                                                  Text("DELIVERED",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF555555)))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Detil Pengiriman
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                        )));
                  },
                  child: Text("LACAK PAKET"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7476ED),
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              //About Us
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "About Us",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 1.05,
                      color: Color(0xFF5A5A5A)),
                ),
              ),

              //Desc About Us
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Aplikasi kita bikin gampang buat si pengirim dan si penerima paket buat cek status atau melacak di mana paketnya sekarang. Tiap hari banyak banget nomor resi dari macem-macem kurir kita lacak lewat berbagai website, widget, dan aplikasi mobile masing-masing ekspedisi. Jadi, gak perlu ribet nyari-nyari lagi, mau pake kurir apa aja, tracking resi pengiriman barang tinggal di satu tempat aja. Asyik kan?",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      fontSize: 14,
                      color: Color(0xFF7a7a7a)),
                ),
              ),

              //Copyright
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Copyright Cek Resi by Banghanzz © 2023",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color(0xFF5A5A5A)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "All Rights Reserved.",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color(0xFF5A5A5A)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
