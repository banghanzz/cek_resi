import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../controllers/home_controller.dart';
import '../widgets/result_widget.dart';

class HomeView extends GetView<HomeController> {
  List<Map<String, String>> courierList = [
    {
      "courier_id": "1",
      "courier_name": "JNE Express",
      "courier_inisial": "jne",
      "logo_url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/New_Logo_JNE.png/640px-New_Logo_JNE.png"
    },
    {
      "courier_id": "2",
      "courier_name": "J&T Express",
      "courier_inisial": "jnt",
      "logo_url": "https://jet.co.id/static/images/logo-red.png"
    },
    {
      "courier_id": "3",
      "courier_name": "SiCepat Express",
      "courier_inisial": "sicepat",
      "logo_url": "https://boostr.id/images/track-shipping/courier/sicepat.png"
    },
    {
      "courier_id": "4",
      "courier_name": "Shopee Express",
      "courier_inisial": "spx",
      "logo_url":
          "https://lh5.googleusercontent.com/pk28w-cxZU7CAlfMKHUvZT4sXY-FmTmh5-tSL2O1_wBqDbW7Hi8B9276Ri84aUHG-l8CyHNeKTw8nNSDkGO_z-iV_nn6dCn34kuhD5J5Md0zyhCIfJAZESWXOehTdQ3J6UJHJPRW"
    },
    {
      "courier_id": "5",
      "courier_name": "AnterAja",
      "courier_inisial": "anteraja",
      "logo_url":
          "https://sejutakurir.com/wp-content/uploads/2020/08/Logo-Anteraja.png"
    },
    {
      "courier_id": "6",
      "courier_name": "Ninja Express",
      "courier_inisial": "ninja",
      "logo_url":
          "https://seeklogo.com/images/N/ninja-xpress-logo-860168EFBE-seeklogo.com.png"
    },
    {
      "courier_id": "7",
      "courier_name": "POS Indoensia",
      "courier_inisial": "pos",
      "logo_url":
          "https://upload.wikimedia.org/wikipedia/id/thumb/0/00/Pos-Indonesia.svg/1200px-Pos-Indonesia.svg.png"
    },
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
                      onChanged: (value) {
                        controller.courierLogo.value = value?['logo_url'] ?? "";
                        controller.courierSelected.value =
                            value?['courier_inisial'] ?? "";
                      },
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
                    controller: controller.awbNumberC,
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
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => resultSheet(),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                    );
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
                height: 120,
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
